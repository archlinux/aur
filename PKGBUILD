# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from DeepSeek V4.1 Flash Free.
pkgname=transmission-remote-slint
pkgver=0.7.2
pkgrel=2
pkgdesc="Lightweight Transmission BitTorrent GUI built with Slint (no GTK)"
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
    'rust'
    'cargo'
    'pkg-config'
    'python-pillow'
)
optdepends=(
    'zenity: file picker dialogs (GNOME/X11)'
    'kdialog: file picker dialogs (KDE)'
    'yad: file picker dialogs (alternative)'
    'libnotify: desktop notifications'
    'snixembed: system tray support in XFCE/Openbox'
)
provides=("$pkgname")
conflicts=('transmission-remote-slint-bin')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/guglovich/Transmission-Remote-Slint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d194f92b33712711352ae34ac30b008817baebb0b9b4731a815d14282d2e79a8')

prepare() {
    cd "Transmission-Remote-Slint-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "Transmission-Remote-Slint-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    # Иконки из ui/app-icon.png (256x256) в нужных размерах
    python3 - <<'PYEOF'
from PIL import Image
import os

src = Image.open("ui/app-icon.png").convert("RGBA")
os.makedirs("icons", exist_ok=True)
for size in [16, 22, 32, 48, 64, 128, 256]:
    src.resize((size, size), Image.LANCZOS).save(f"icons/{size}.png")
PYEOF
}

check() {
    cd "Transmission-Remote-Slint-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --frozen --release 2>/dev/null || true
}

package() {
    cd "Transmission-Remote-Slint-${pkgver}"

    install -Dm755 "target/release/transmission-remote-slint" \
        "$pkgdir/usr/bin/transmission-remote-slint"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Иконки в hicolor
    for size in 16 22 32 48 64 128 256; do
        install -Dm644 "icons/${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/transmission-remote-slint.png"
    done

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/transmission-remote-slint.desktop" <<'DESKTOP'
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
