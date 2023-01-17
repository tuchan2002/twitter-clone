class AddDisplayNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_name, :string

    query = "UPDATE users SET display_name = username WHERE display_name is null"
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    remove_column :users, :display_name
  end
end
