#!/usr/bin/env python3

import evdev
import logging
import time
import os
from pathlib import Path

KEYBOARD_NAME_HINT = "ITE Device(8176)"
FN_LOCK_PATH = "/sys/bus/platform/devices/VPC2004:00/fn_lock"

MODIFIER_KEYS = {
    evdev.ecodes.KEY_LEFTCTRL, evdev.ecodes.KEY_RIGHTCTRL,
    evdev.ecodes.KEY_LEFTSHIFT, evdev.ecodes.KEY_RIGHTSHIFT,
    evdev.ecodes.KEY_LEFTALT, evdev.ecodes.KEY_RIGHTALT,
    evdev.ecodes.KEY_LEFTMETA, evdev.ecodes.KEY_RIGHTMETA,
}

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S"
)

def find_keyboard_device(hint: str):
    """Find input device by partial name match."""
    for path in evdev.list_devices():
        device = evdev.InputDevice(path)
        if hint.lower() in device.name.lower():
            logging.info(f"Found keyboard: {device.path} ({device.name})")
            return device
    return None

def set_fn_lock(value: int):
    """Set Fn Lock state (1 = on/standard F-keys, 0 = off/media priority)."""
    if not Path(FN_LOCK_PATH).exists():
        logging.error(f"Fn Lock sysfs path not found: {FN_LOCK_PATH}")
        logging.error("Ensure ideapad_laptop module is loaded and your model supports it.")
        return False
    
    try:
        with open(FN_LOCK_PATH, "w") as f:
            f.write(str(value))
        logging.info(f"Fn Lock set to {value} ({'ON - standard F-keys' if value else 'OFF - media priority'})")
        return True
    except PermissionError:
        logging.error(f"Permission denied writing to {FN_LOCK_PATH}. Run with sudo/root.")
        return False
    except Exception as e:
        logging.error(f"Failed to set Fn Lock: {e}")
        return False

def main():
    device = find_keyboard_device(KEYBOARD_NAME_HINT)
    if not device:
        logging.error(f"Keyboard containing '{KEYBOARD_NAME_HINT}' not found!")
        logging.error("Available devices:")
        for path in evdev.list_devices():
            dev = evdev.InputDevice(path)
            logging.error(f"  {dev.path}: {dev.name}")
        return

    current_modifiers_pressed = 0
    set_fn_lock(1)

    logging.info("Listening for modifier key events... (Press Ctrl+C to exit)")

    while True:
        try:
            for event in device.read_loop():
                if event.type != evdev.ecodes.EV_KEY or event.code not in MODIFIER_KEYS:
                    continue

                if event.value == 1:
                    current_modifiers_pressed += 1
                    if current_modifiers_pressed == 1:
                        set_fn_lock(0)
                elif event.value == 0:
                    current_modifiers_pressed = max(0, current_modifiers_pressed - 1)
                    if current_modifiers_pressed == 0:
                        set_fn_lock(1)

        except (OSError, IOError) as e:
            logging.warning(f"Device disconnected ({e}). Attempting to reconnect in 5s...")
            time.sleep(5)
            device = find_keyboard_device(KEYBOARD_NAME_HINT)
            if device:
                current_modifiers_pressed = 0
                set_fn_lock(1)
            else:
                logging.error("Reconnect failed. Retrying...")
                time.sleep(5)
        except KeyboardInterrupt:
            logging.info("Shutting down gracefully.")
            set_fn_lock(1)
            break

if __name__ == "__main__":
    main()
