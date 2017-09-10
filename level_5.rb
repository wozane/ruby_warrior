class Player
  Min_health = 16
  @health

  def play_turn(warrior)
    @health = warrior.health if @health.nil?
    under_attack = warrior.health < @health

    if warrior.feel.empty?
        if warrior.health >= Min_health || under_attack
          warrior.walk!
        else
          warrior.rest!
        end
    else
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end

    @health = warrior.health
  end
end

