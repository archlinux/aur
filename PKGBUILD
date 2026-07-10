# Maintainer: berkkucukk <berkkucukk@proton.me>

pkgname=maze-guard
pkgver=2.2.0
pkgrel=1
pkgdesc="Maze Guard — public WiFi security monitor: MITM detection, MAC randomization, nftables firewall"
arch=('x86_64' 'aarch64')
url="https://github.com/berk-kucuk/maze-guard"
license=('MIT')
# Renamed from the 'maze' package — replace/conflict so pacman migrates cleanly.
replaces=('maze')
conflicts=('maze')

# Python packages are installed into an isolated venv at /opt/maze-guard/venv
# (NOT into the system Python) — see maze-guard.install for post_install details.
depends=(
    'python>=3.11'     # interpreter only; libs go in venv
    'python-dbus'      # linked into venv (avoids dbus-python compile)
    'nftables'         # firewall backend
    'iproute2'         # ip route / ip neigh commands
    'dbus'             # dbus daemon (runtime)
    'libdbus'          # shared library for dbus-python
    'systemd'          # runs the privileged helper as a daemon (maze-guard.service)
)
makedepends=()
optdepends=(
    'wireless_tools: WiFi interface monitoring (iwgetid)'
    'imagemagick: resize app icon to multiple sizes during install'
)
install=maze-guard.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/maze-guard/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f8cdc5f30ad87f5212bc5af4f6b7bb847585da468151e6d56ddfc7c484c9280')

package() {
    cd "$srcdir/maze-guard-${pkgver}"

    # ── Application source → /opt/maze-guard ────────────────────────────────────
    install -dm755 "$pkgdir/opt/maze-guard"
    cp -r maze main.py "$pkgdir/opt/maze-guard/"
    [[ -f pyproject.toml   ]] && install -m644 pyproject.toml   "$pkgdir/opt/maze-guard/"
    [[ -f requirements.txt ]] && install -m644 requirements.txt "$pkgdir/opt/maze-guard/"
    [[ -d assets ]] && cp -r assets "$pkgdir/opt/maze-guard/"
    [[ -f MAZE.png ]] && install -m644 MAZE.png "$pkgdir/opt/maze-guard/"

    # Placeholder venv dir — populated in post_install
    install -dm755 "$pkgdir/opt/maze-guard/venv"

    # ── Launcher → /usr/bin/maze-guard ───────────────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    install -m755 /dev/stdin "$pkgdir/usr/bin/maze-guard" << 'LAUNCHER'
#!/usr/bin/env bash
exec /opt/maze-guard/venv/bin/python3 /opt/maze-guard/main.py "$@"
LAUNCHER

    # ── Privileged helper daemon (systemd) ─────────────────────────────────
    # Runs as root so the GUI never needs a sudo password. Access to its socket
    # (/run/maze/maze.sock) is gated by the 'maze' group.
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 /dev/stdin "$pkgdir/usr/lib/systemd/system/maze-guard.service" << 'UNIT'
[Unit]
Description=Maze Guard privileged helper
After=network.target

[Service]
Type=simple
ExecStart=/opt/maze-guard/venv/bin/python3 /opt/maze-guard/maze/helper.py
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
    install -m644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/maze-guard.conf" << 'SYSUSERS'
g maze -
SYSUSERS

    # ── .desktop entry (application menu) ──────────────────────────────────
    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 /dev/stdin "$pkgdir/usr/share/applications/maze-guard.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.1
Type=Application
Name=Maze Guard
GenericName=Network Security Monitor
Comment=Public WiFi protection — MITM detection, MAC randomization, firewall
Exec=/usr/bin/maze-guard
Icon=maze-guard
Terminal=false
Categories=Network;Security;System;
Keywords=security;wifi;network;firewall;privacy;mitm;vpn;
StartupNotify=true
StartupWMClass=maze-guard
X-GNOME-UsesNotifications=true
DESKTOP

    # ── Autostart entry (start hidden in the system tray on login) ─────────
    install -dm755 "$pkgdir/etc/xdg/autostart"
    install -m644 /dev/stdin "$pkgdir/etc/xdg/autostart/maze-guard.desktop" << 'AUTOSTART'
[Desktop Entry]
Version=1.1
Type=Application
Name=Maze Guard
GenericName=Network Security Monitor
Comment=Start Maze Guard minimized in the system tray
Exec=/usr/bin/maze-guard --background
Icon=maze-guard
Terminal=false
Categories=Network;Security;System;
StartupNotify=false
StartupWMClass=maze-guard
X-GNOME-Autostart-enabled=true
AUTOSTART

    # ── Icons ──────────────────────────────────────────────────────────────
    if [[ -f MAZE.png ]]; then
        for size in 16 32 48 64 128 256 512; do
            install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
            if command -v convert &>/dev/null; then
                convert -resize "${size}x${size}" MAZE.png \
                    "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze-guard.png" \
                    2>/dev/null \
                    || install -m644 MAZE.png \
                        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze-guard.png"
            else
                install -m644 MAZE.png \
                    "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/maze-guard.png"
            fi
        done
    fi

    # ── License ────────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    [[ -f LICENSE ]] && install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
