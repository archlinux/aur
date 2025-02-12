#!/usr/bin/env python3

import evdev
import subprocess
import time

# Path to the keyboard device
keyboard_path = "/dev/input/event4"

try:
    device = evdev.InputDevice(keyboard_path)
    print(f"Listening for events on {keyboard_path} ({device.name})...")
except Exception as e:
    print(f"Error: Failed to access device {keyboard_path} - {e}")
    exit(1)

# Modifier keys to listen for
MODIFIER_KEYS = {evdev.ecodes.KEY_LEFTCTRL, evdev.ecodes.KEY_RIGHTCTRL,
                 evdev.ecodes.KEY_LEFTSHIFT, evdev.ecodes.KEY_RIGHTSHIFT,
                 evdev.ecodes.KEY_LEFTALT, evdev.ecodes.KEY_RIGHTALT}

# Path to the fn_lock file
FN_LOCK_PATH = "/sys/bus/platform/devices/VPC2004:00/fn_lock"

# Function to set fn_lock value
def set_fn_lock(value):
    try:
        with open(FN_LOCK_PATH, "w") as f:
            f.write(str(value))
        print(f"Fn Lock set to {value}")
    except Exception as e:
        print(f"Error: Unable to write to {FN_LOCK_PATH} - {e}")

# Ensure fn_lock starts at 1
set_fn_lock(1)  # Always reset to 1 at startup

# Keep track of pressed modifier keys
pressed_keys = set()

# Monitor keyboard input events
while True:
    try:
        for event in device.read_loop():
            if event.type == evdev.ecodes.EV_KEY:
                if event.code in MODIFIER_KEYS:
                    if event.value == 1:  # Key press
                        pressed_keys.add(event.code)
                        if len(pressed_keys) == 1:  # If it's the first key pressed
                            print(f"Modifier key {event.code} pressed, toggling Fn Lock...")
                            set_fn_lock(0)  # Toggle to 0
                    elif event.value == 0:  # Key release
                        pressed_keys.discard(event.code)
                        if not pressed_keys:  # If no modifier keys are held
                            print(f"Modifier key {event.code} released, restoring Fn Lock...")
                            set_fn_lock(1)  # Always restore to 1
    except OSError as e:
        print(f"Device disconnected: {e}")
        print("Reconnecting in 5 seconds...")
        time.sleep(5)
        try:
            device = evdev.InputDevice(keyboard_path)
            pressed_keys.clear()  # Reset the state after reconnection
        except Exception as e:
            print(f"Failed to reconnect to device: {e}")
            exit(1)

