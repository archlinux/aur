# Maintainer: d0rfm4tr4tz3 <aur@standort.tk>
#
# AUR package: syna3602-bridge
#
# Fixes the broken SYNA3602 (Hantick HTIX5288) touchpad found in Chuwi AeroBook
# and similar devices. The firmware sends 4 contacts per frame without
# ABS_MT_SLOT switching – only the first X/Y pair is valid, the remaining 3
# are garbage (>50000) and overwrite slot 0, which makes libinput discard
# everything.
#
# This bridge grabs the original device, takes the first valid X/Y pair,
# and creates a clean uinput device with MT Protocol B (2 slots). When the
# device signals BTN_TOOL_DOUBLETAP a second slot is emulated, enabling
# native two-finger scrolling in libinput/GNOME.
#
# Self-contained: no external sources needed, everything is embedded here.

pkgname=syna3602-bridge
pkgver=2.0.0
pkgrel=2
pkgdesc="SYNA3602 Touchpad Bridge – filters garbage contacts, enables two-finger scrolling"
arch=('any')
url="https://github.com/torvalds/linux/blob/master/drivers/hid/hid-multitouch.c"
license=('MIT')
depends=('python' 'python-evdev')
source=()
sha256sums=()

package() {
  # ---- bridge script ----
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/syna3602-bridge.py" << 'PYEOF'
#!/usr/bin/env python3
"""
SYNA3602 Touchpad Bridge v2 – filters garbage contacts and emulates correct
MT Protocol B with 2-finger scrolling via a virtual slot 1.
"""
import evdev
from evdev import ecodes as e, UInput, InputDevice
import select
import signal
import sys

DEVICE_NAME = "SYNA3602:00 0911:5288 Touchpad"
UINPUT_NAME = "SYNA3602 Touchpad (filtered)"
ABS_X_MIN, ABS_X_MAX = 0, 2628
ABS_Y_MIN, ABS_Y_MAX = 0, 1332
ABS_X_RES, ABS_Y_RES = 24, 19
TOUCH_TIMEOUT_S = 0.100
TWO_FINGER_OFFSET = 150

running = True


def find_touchpad():
    for path in evdev.list_devices():
        try:
            dev = InputDevice(path)
            if dev.name == DEVICE_NAME:
                dev.close()
                return path
        except (PermissionError, FileNotFoundError, OSError):
            continue
    return None


def clamp(val, lo, hi):
    return max(lo, min(hi, val))


def create_uinput():
    cap = {
        e.EV_KEY: [
            e.BTN_LEFT, e.BTN_TOUCH,
            e.BTN_TOOL_FINGER, e.BTN_TOOL_DOUBLETAP,
        ],
        e.EV_ABS: [
            (e.ABS_X, (0, 0, ABS_X_MAX, 0, 0, ABS_X_RES)),
            (e.ABS_Y, (0, 0, ABS_Y_MAX, 0, 0, ABS_Y_RES)),
            (e.ABS_MT_SLOT, (0, 0, 1, 0, 0, 0)),
            (e.ABS_MT_POSITION_X, (0, 0, ABS_X_MAX, 0, 0, ABS_X_RES)),
            (e.ABS_MT_POSITION_Y, (0, 0, ABS_Y_MAX, 0, 0, ABS_Y_RES)),
            (e.ABS_MT_TRACKING_ID, (0, 0, 65535, 0, 0, 0)),
        ],
        e.EV_MSC: [e.MSC_TIMESTAMP],
    }
    return UInput(
        events=cap,
        name=UINPUT_NAME,
        vendor=0x0911, product=0x5288, version=0x100,
        input_props=[e.INPUT_PROP_POINTER, e.INPUT_PROP_BUTTONPAD],
    )


def run(src: InputDevice):
    ui = create_uinput()
    src.grab()
    print(f"Bridge v2: {src.path} -> uinput device (grabbed)", flush=True)

    frame_x: int | None = None
    frame_y: int | None = None
    src_doubletap = False
    tid_counter = 0
    slot0_active = False
    slot0_tid: int = -1
    slot1_active = False
    slot1_tid: int = -1
    touch_on = False

    def next_tid() -> int:
        nonlocal tid_counter
        tid_counter += 1
        return tid_counter

    def write_frame():
        nonlocal touch_on, slot0_active, slot0_tid, slot1_active, slot1_tid
        valid = frame_x is not None and frame_y is not None

        ui.write(e.EV_ABS, e.ABS_MT_SLOT, 0)
        if valid and not slot0_active:
            slot0_active = True
            slot0_tid = next_tid()
            ui.write(e.EV_ABS, e.ABS_MT_TRACKING_ID, slot0_tid)
        elif not valid and slot0_active:
            slot0_active = False
            ui.write(e.EV_ABS, e.ABS_MT_TRACKING_ID, -1)
        if valid and slot0_active:
            ui.write(e.EV_ABS, e.ABS_MT_POSITION_X, frame_x)
            ui.write(e.EV_ABS, e.ABS_MT_POSITION_Y, frame_y)

        ui.write(e.EV_ABS, e.ABS_MT_SLOT, 1)
        if valid and src_doubletap and not slot1_active:
            slot1_active = True
            slot1_tid = next_tid()
            ui.write(e.EV_ABS, e.ABS_MT_TRACKING_ID, slot1_tid)
        elif (not valid or not src_doubletap) and slot1_active:
            slot1_active = False
            ui.write(e.EV_ABS, e.ABS_MT_TRACKING_ID, -1)
        if valid and slot1_active:
            sx = clamp(frame_x + TWO_FINGER_OFFSET, ABS_X_MIN, ABS_X_MAX)
            sy = clamp(frame_y + TWO_FINGER_OFFSET, ABS_Y_MIN, ABS_Y_MAX)
            ui.write(e.EV_ABS, e.ABS_MT_POSITION_X, sx)
            ui.write(e.EV_ABS, e.ABS_MT_POSITION_Y, sy)

        if valid:
            if not touch_on:
                touch_on = True
            ui.write(e.EV_KEY, e.BTN_TOUCH, 1)
            if src_doubletap:
                ui.write(e.EV_KEY, e.BTN_TOOL_FINGER, 0)
                ui.write(e.EV_KEY, e.BTN_TOOL_DOUBLETAP, 1)
            else:
                ui.write(e.EV_KEY, e.BTN_TOOL_FINGER, 1)
                ui.write(e.EV_KEY, e.BTN_TOOL_DOUBLETAP, 0)
            ui.write(e.EV_ABS, e.ABS_X, frame_x)
            ui.write(e.EV_ABS, e.ABS_Y, frame_y)
        else:
            if touch_on:
                touch_on = False
                ui.write(e.EV_KEY, e.BTN_TOUCH, 0)
                ui.write(e.EV_KEY, e.BTN_TOOL_FINGER, 0)
                ui.write(e.EV_KEY, e.BTN_TOOL_DOUBLETAP, 0)
        ui.syn()

    poll = select.poll()
    poll.register(src.fd, select.POLLIN)

    while running:
        ready = poll.poll(int(TOUCH_TIMEOUT_S * 1000))
        if not ready:
            if touch_on:
                frame_x = None
                frame_y = None
                write_frame()
            continue
        for _ in ready:
            for ev in src.read():
                if not running:
                    break
                if ev.type == e.EV_ABS:
                    code, val = ev.code, ev.value
                    if code == e.ABS_MT_POSITION_X and frame_x is None:
                        if ABS_X_MIN <= val <= ABS_X_MAX:
                            frame_x = val
                    elif code == e.ABS_MT_POSITION_Y and frame_y is None:
                        if frame_x is not None and ABS_Y_MIN <= val <= ABS_Y_MAX:
                            frame_y = val
                elif ev.type == e.EV_KEY:
                    if ev.code == e.BTN_LEFT:
                        ui.write(e.EV_KEY, e.BTN_LEFT, ev.value)
                        ui.syn()
                    elif ev.code == e.BTN_TOOL_DOUBLETAP:
                        src_doubletap = ev.value == 1
                elif ev.type == e.EV_SYN and ev.code == e.SYN_REPORT:
                    write_frame()
                    frame_x = None
                    frame_y = None

    src.ungrab()
    ui.close()
    src.close()
    print("Bridge stopped.", flush=True)


def handle_signal(signum, frame):
    global running
    running = False


if __name__ == "__main__":
    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGTERM, handle_signal)
    source = find_touchpad()
    if not source:
        print(f"ERROR: '{DEVICE_NAME}' not found!", file=sys.stderr)
        sys.exit(1)
    try:
        src = InputDevice(source)
    except PermissionError:
        print("ERROR: Permission denied – run as root.", file=sys.stderr)
        sys.exit(1)
    run(src)
PYEOF
  chmod 755 "${pkgdir}/usr/bin/syna3602-bridge.py"

  # ---- systemd service ----
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cat > "${pkgdir}/usr/lib/systemd/system/syna3602-bridge.service" << 'SERVEOF'
[Unit]
Description=SYNA3602 Touchpad Bridge v2 – filters garbage contacts, emulates MT protocol for 2-finger scrolling
Documentation=https://github.com/torvalds/linux/blob/master/drivers/hid/hid-multitouch.c
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/syna3602-bridge.py
Restart=on-failure
RestartSec=2

[Install]
WantedBy=multi-user.target
SERVEOF

  # ---- post-install hint (shown during makepkg / yay) ---- (shown during makepkg / yay) ----
  echo ""
  echo "============================================"
  echo "  Enable the service on your machine:"
  echo "    sudo systemctl enable --now syna3602-bridge.service"
  echo "============================================"
  echo ""
}
