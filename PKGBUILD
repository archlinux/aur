# Maintainer: berkkucukk <berkkucukk@proton.me>

pkgname=maze
pkgver=1.3.0
pkgrel=1
pkgdesc="Public WiFi security monitor — MITM detection, MAC randomization, nftables firewall"
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
)
makedepends=()
optdepends=(
    'wireless_tools: WiFi interface monitoring (iwgetid)'
    'imagemagick: resize app icon to multiple sizes during install'
)
install=maze.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Maze/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8cf0f43cca5929859f52d80d3ef8dd329cf4961b317186d6583d3536d51623b')

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

    # ── .desktop entry ─────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 /dev/stdin "$pkgdir/usr/share/applications/maze.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.1
Type=Application
Name=Maze
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

    # ── Sudoers example ────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 /dev/stdin \
        "$pkgdir/usr/share/doc/$pkgname/maze.sudoers.example" << 'SUDOERS'
# Maze — skip sudo password prompt at startup.
#
# 1. Copy this file to /etc/sudoers.d/maze
# 2. Replace USERNAME with your actual Linux username
# 3. Verify with:  sudo visudo -c
#
# USERNAME ALL=(root) NOPASSWD: /opt/maze/venv/bin/python3 /opt/maze/maze/helper.py *
SUDOERS
}
