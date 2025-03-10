class EntriesController < ApplicationController

  def index
    @entries = Entry.where({ "user_id" => session["user_id"] })
  end

  def new
    @entry = Entry.new
  end

  def create
    if User.find_by({ "id" => session["user_id"] }) != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = session["user_id"]
      @entry.save
    end 

    redirect_to "/places/#{@entry["place_id"]}"
  end

end
