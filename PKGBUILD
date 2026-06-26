# Maintainer: berkkucukk <berkkucukk@proton.me>

pkgname=maze
pkgver=2.0.0
pkgrel=1
pkgdesc="Maze Network — public WiFi security monitor: MITM detection, MAC randomization, nftables firewall"
arch=('x86_64' 'aarch64')
url="https://github.com/berk-kucuk/Maze"
license=('MIT')

# Python packages are installed into an isolated venv at /opt/maze/venv
# (NOT into the system Python) — see maze.install for post_install details.
depends=(
    'python>=3.11'     # interpreter only; libs go in venv
    'python-dbus'      # linked into venv (avoids dbus-python compile)
    'nftables'         # firewall backend
    'iproute2'         # ip route / ip neigh commands
    'dbus'             # dbus daemon (runtime)
    'libdbus'          # shared library for dbus-python
    'systemd'          # runs the privileged helper as a daemon (maze.service)
)
makedepends=()
optdepends=(
    'wireless_tools: WiFi interface monitoring (iwgetid)'
    'imagemagick: resize app icon to multiple sizes during install'
)
install=maze.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Maze/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd1cc1a0fd87e6ab7f2469daa27550d541c144c587055c499f8cff3d8dc0f0e9')

package() {
    cd "$srcdir/Maze-${pkgver}"

    # ── Application source → /opt/maze ────────────────────────────────────
    install -dm755 "$pkgdir/opt/maze"
    cp -r maze main.py "$pkgdir/opt/maze/"
    [[ -f pyproject.toml   ]] && install -m644 pyproject.toml   "$pkgdir/opt/maze/"
    [[ -f requirements.txt ]] && install -m644 requirements.txt "$pkgdir/opt/maze/"
    [[ -d assets ]] && cp -r assets "$pkgdir/opt/maze/"
    [[ -f MAZE.png ]] && install -m644 MAZE.png "$pkgdir/opt/maze/"

    # Placeholder venv dir — populated in post_install
    install -dm755 "$pkgdir/opt/maze/venv"

    # ── Launcher → /usr/bin/maze ───────────────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    install -m755 /dev/stdin "$pkgdir/usr/bin/maze" << 'LAUNCHER'
#!/usr/bin/env bash
exec /opt/maze/venv/bin/python3 /opt/maze/main.py "$@"
LAUNCHER

    # ── Privileged helper daemon (systemd) ─────────────────────────────────
    # Runs as root so the GUI never needs a sudo password. Access to its socket
    # (/run/maze/maze.sock) is gated by the 'maze' group.
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 /dev/stdin "$pkgdir/usr/lib/systemd/system/maze.service" << 'UNIT'
[Unit]
Description=Maze Network privileged helper
After=network.target

[Service]
Type=simple
ExecStart=/opt/maze/venv/bin/python3 /opt/maze/maze/helper.py
Restart=on-failure
RestartSec=2
RuntimeDirectory=maze
RuntimeDirectoryMode=0750
ProtectHome=true
ProtectControlGroups=true
ProtectKernelLogs=true

[Install]
WantedBy=multi-user.target
UNIT

    # ── sysusers: create the 'maze' group that gates the helper socket ──────
    install -dm755 "$pkgdir/usr/lib/sysusers.d"
    install -m644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/maze.conf" << 'SYSUSERS'
g maze -
SYSUSERS

    # ── .desktop entry (application menu) ──────────────────────────────────
    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 /dev/stdin "$pkgdir/usr/share/applications/maze.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.1
Type=Application
Name=Maze Network
GenericName=Network Security Monitor
Comment=Public WiFi protection — MITM detection, MAC randomization, firewall
Exec=/usr/bin/maze
Icon=maze
Terminal=false
Categories=Network;Security;System;
Keywords=security;wifi;network;firewall;privacy;mitm;vpn;
StartupNotify=true
StartupWMClass=maze
X-GNOME-UsesNotifications=true
DESKTOP

    # ── Autostart entry (start hidden in the system tray on login) ─────────
    install -dm755 "$pkgdir/etc/xdg/autostart"
    install -m644 /dev/stdin "$pkgdir/etc/xdg/autostart/maze.desktop" << 'AUTOSTART'
[Desktop Entry]
Version=1.1
Type=Application
Name=Maze Network
GenericName=Network Security Monitor
Comment=Start Maze Network minimized in the system tray
Exec=/usr/bin/maze --background
Icon=maze
Terminal=false
Categories=Network;Security;System;
StartupNotify=false
StartupWMClass=maze
X-GNOME-Autostart-enabled=true
AUTOSTART

    # ── Icons ──────────────────────────────────────────────────────────────
    if [[ -f MAZE.png ]]; then
        for size in 16 32 48 64 128 256 512; do
            install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
            if command -v convert &>/dev/null; then
                convert -resize "${size}x${size}" MAZE.png \
                    "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze.png" \
                    2>/dev/null \
                    || install -m644 MAZE.png \
                        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze.png"
            else
                install -m644 MAZE.png \
                    "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze.png"
            fi
        done
    fi

    # ── License ────────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    [[ -f LICENSE ]] && install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
