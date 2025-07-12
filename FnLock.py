#!/usr/bin/env python3

import evdev
import time

KEYBOARD_NAME = "ITE Tech. Inc. ITE Device(8176) Keyboard"
FN_LOCK_PATH = "/sys/bus/platform/devices/VPC2004:00/fn_lock"

MODIFIER_KEYS = {
    evdev.ecodes.KEY_LEFTCTRL, evdev.ecodes.KEY_RIGHTCTRL,
    evdev.ecodes.KEY_LEFTSHIFT, evdev.ecodes.KEY_RIGHTSHIFT,
    evdev.ecodes.KEY_LEFTALT, evdev.ecodes.KEY_RIGHTALT
}

def find_keyboard_device(name_hint):
    devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
    for device in devices:
        if device.name == name_hint:
            return device
    return None

def set_fn_lock(value):
    try:
        with open(FN_LOCK_PATH, "w") as f:
            f.write(str(value))
        print(f"Fn Lock set to {value}")
    except Exception as e:
        print(f"Error: Unable to write to {FN_LOCK_PATH} - {e}")

device = find_keyboard_device(KEYBOARD_NAME)
if not device:
    print(f"Error: Keyboard '{KEYBOARD_NAME}' not found!")
    exit(1)

print(f"Listening for events on {device.path} ({device.name})...")
set_fn_lock(1)

pressed_keys = set()

while True:
    try:
        for event in device.read_loop():
            if event.type == evdev.ecodes.EV_KEY and event.code in MODIFIER_KEYS:
                if event.value == 1:
                    pressed_keys.add(event.code)
                    if len(pressed_keys) == 1:
                        set_fn_lock(0)
                elif event.value == 0:
                    pressed_keys.discard(event.code)
                    if not pressed_keys:
                        set_fn_lock(1)
    except OSError:
        print("Device disconnected. Reconnecting...")
        time.sleep(5)
        device = find_keyboard_device(KEYBOARD_NAME)
        pressed_keys.clear()

