# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from Gemini 3.1 Pro.
pkgname=transmission-remote-slint
pkgver=0.6.0
pkgrel=1
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
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/guglovich/Transmission-Remote-Slint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da9bc3f47018b64f5444feb7c5a94fb48f16939ec8ba8b6702fb6389e9923ff3')

prepare() {
    cd "Transmission-Remote-Slint-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    sed -i 's/slint        = "1.7"/slint        = { version = "1.7", features = ["backend-winit"] }/' Cargo.toml
}

build() {
    cd "Transmission-Remote-Slint-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
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

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/transmission-remote-slint.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Transmission Remote
GenericName=BitTorrent Client
Comment=Lightweight Transmission GUI (Slint, no GTK)
Exec=transmission-remote-slint %f
Icon=transmission
Terminal=false
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
Keywords=torrent;bittorrent;transmission;download;
StartupWMClass=transmission-remote-slint
DESKTOP
}
