# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from Space Bunny Free.
pkgname=transmission-remote-slint-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Lightweight Transmission BitTorrent GUI built with Slint (no GTK) — prebuilt binary"
arch=('x86_64')
url="https://github.com/guglovich/Transmission-Remote-Slint"
license=('GPL-2.0-or-later')
depends=(
    'transmission-cli'
    'libxcb'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'dbus'
)
makedepends=(
    'python-pillow'
)
optdepends=(
    'zenity: file picker dialogs (GNOME/X11)'
    'kdialog: file picker dialogs (KDE)'
    'yad: file picker dialogs (alternative)'
    'libnotify: desktop notifications'
    'snixembed: system tray support in XFCE/Openbox'
    'xdotool: taskbar icon support'
)
provides=('transmission-remote-slint')
conflicts=('transmission-remote-slint')
options=(!debug)
source=(
    "transmission-remote-slint-v${pkgver}-linux-x64::https://github.com/guglovich/Transmission-Remote-Slint/releases/download/v${pkgver}/transmission-remote-slint-v${pkgver}-linux-x64"
    "app-icon.png::https://github.com/guglovich/Transmission-Remote-Slint/raw/v${pkgver}/ui/app-icon.png"
)
sha256sums=('ace975a093f93fc8e96a5d68614a5afd477b3714509e07eea533cdcd873ea4fe'
            'af466bb0c3838f5dfa8151d73842a5ee8eb21bae4929fe374a90dd22e79ea2e1')

build() {
    # Генерируем иконки нужных размеров
    python3 - <<'PYEOF'
from PIL import Image
import os

src = Image.open("app-icon.png").convert("RGBA")
os.makedirs("icons", exist_ok=True)
for size in [16, 22, 32, 48, 64, 128, 256]:
    img = src.resize((size, size), Image.LANCZOS)
    img.save(f"icons/{size}.png")
PYEOF
}

package() {
    # Бинарник
    install -Dm755 "transmission-remote-slint-v${pkgver}-linux-x64" \
        "$pkgdir/usr/bin/transmission-remote-slint"

    # Иконки в hicolor
    for size in 16 22 32 48 64 128 256; do
        install -Dm644 "icons/${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/transmission-remote-slint.png"
    done

    # .desktop файл
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/transmission-remote-slint.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Transmission Remote
GenericName=BitTorrent Client
Comment=Lightweight Transmission GUI (Slint, no GTK)
Exec=transmission-remote-slint %f
Icon=transmission-remote-slint
Terminal=false
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
Keywords=torrent;bittorrent;transmission;download;
StartupWMClass=transmission-remote-slint
DESKTOP
}
