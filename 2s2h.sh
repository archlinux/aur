#!/bin/bash
SHIP_HOME="/home/$USER/.config/2s2h"

if [ $# -eq 0 ]; then
    if [ -d "$SHIP_HOME" ]; then
        # Take action if $SHIP_HOME exists
        echo "Starting game"
        cd "$SHIP_HOME" || exit
       ./2s2h
    else
        # Setup if $SHIP_HOME does not exist
        mkdir -p "$SHIP_HOME"
        mkdir -p "$SHIP_HOME/mods"
        
        # Symlinking and copying files
        ln -sf /usr/share/games/2s2h/2s2h "$SHIP_HOME"
        ln -sf /usr/share/games/2s2h/assets "$SHIP_HOME"
        ln -sf /usr/share/games/2s2h/2ship.o2r "$SHIP_HOME"
        
        # Change directory to $SHIP_HOME and start the game
        cd "$SHIP_HOME" || exit
       ./2s2h
    fi
else
    echo "Usage: $0"
fi
