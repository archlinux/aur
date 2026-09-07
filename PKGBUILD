# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from GLM 5.3 Flash.
pkgname=transmission-remote-slint
pkgver=0.7.1
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
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/guglovich/Transmission-Remote-Slint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a642e8dc30cc15fa069e26791f6a4fe93362896a12e44615a74c571f21b03684')

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
