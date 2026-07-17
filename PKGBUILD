# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=forsakenac-git
pkgver=r12.3b9aafc
pkgrel=2
pkgdesc="Auto-solver for Forsaken (Roblox) Numberlink puzzles - Linux Edition"
arch=('x86_64')
url="https://github.com/MapleProjects/ForsakenAutoComplete-Linux"
license=('MIT')
depends=('python' 'python-evdev' 'python-opencv' 'python-numpy' 'python-pillow' 'python-platformdirs' 'tk' 'grim' 'ydotool' 'wl-clipboard')
makedepends=('git')
provides=('forsakenac')
conflicts=('forsakenac')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  
  # Install files to /opt
  install -dm755 "$pkgdir/opt/forsakenac"
  cp -r *.py core/ platforms/ assets/ "$pkgdir/opt/forsakenac/"
  
  # Create launcher script with dynamic XWayland display detection
  # tkinter requires an X11 display; on Wayland/Hyprland Xwayland
  # may run on any display number (not always :0)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/forsakenac" << 'LAUNCHER'
#!/bin/bash
cd /opt/forsakenac

# Ensure ydotoold daemon is running (required for ydotool absolute positioning)
if ! pgrep -x ydotoold > /dev/null 2>&1; then
    ydotoold &
    sleep 0.3
fi

# Auto-detect XWayland display for tkinter (needs X11)
if [ -z "$DISPLAY" ]; then
    # Find the actual Xwayland display from running processes
    XDPY=$(pgrep -a Xwayland 2>/dev/null | grep -oP ':\d+' | head -1)
    if [ -n "$XDPY" ]; then
        export DISPLAY="$XDPY"
    elif [ -n "$WAYLAND_DISPLAY" ]; then
        export DISPLAY=":0"
    else
        # Try any wayland socket
        SOCKET=$(ls /run/user/"$(id -u)"/wayland-* 2>/dev/null | grep -v lock | head -1)
        if [ -n "$SOCKET" ]; then
            export WAYLAND_DISPLAY=$(basename "$SOCKET")
            export DISPLAY=":0"
        fi
    fi
fi

exec /usr/bin/python3 flow_solver.py "$@"
LAUNCHER
  
  # Install icon
  install -Dm644 assets/ForsakenAC.png "$pkgdir/usr/share/pixmaps/forsakenac.png"
  
  # Create desktop entry (Terminal=false since it's a GUI app)
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/forsakenac.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=ForsakenAC
GenericName=Numberlink Solver
Comment=Auto-solver for Forsaken Numberlink puzzles
Exec=forsakenac
Icon=forsakenac
Terminal=false
Categories=Game;LogicGame;
Keywords=puzzle;numberlink;forsaken;solver;
DESKTOP
}
