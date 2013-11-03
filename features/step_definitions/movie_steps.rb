# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  assert page.body.to_s.index(e1) < page.body.to_s.index(e2)
end

Then /^I should see all of the movies$/ do
    step %Q{I should see "Amelie"} and 
    step %Q{I should see "Raiders of the Lost Ark"} and 
    step %Q{I should see "The Incredibles"} and 
    step %Q{I should see "The Terminator"} and 
    step %Q{I should see "When Harry Met Sally"} and 
    step %Q{I should see "2001: A Space Odyssey"} and 
    step %Q{I should see "Aladdin"} and 
    step %Q{I should see "Chicken Run"} and 
    step %Q{I should see "Chocolat"} and 
    step %Q{I should see "The Help"}
  
end

Then /^I should not see all of the movies$/ do
    step %Q{I should not see "Amelie"} and 
    step %Q{I should not see "Raiders of the Lost Ark"} and 
    step %Q{I should not see "The Incredibles"} and 
    step %Q{I should not see "The Terminator"} and 
    step %Q{I should not see "When Harry Met Sally"} and 
    step %Q{I should not see "2001: A Space Odyssey"} and 
    step %Q{I should not see "Aladdin"} and 
    step %Q{I should not see "Chicken Run"} and 
    step %Q{I should not see "Chocolat"} and 
    step %Q{I should not see "The Help"}
  
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	if uncheck == nil
    check_str = "check"
  else
    check_str = "uncheck"
  end
  rating_list.split(',').each do |rating|
    ## note somehow there is a space being introduced between "ratings_" and "R"
    ## need to fix it for it to work!!!
    step %Q{I #{check_str} "ratings_#{rating.strip}"}
  end
end
