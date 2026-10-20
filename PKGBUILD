# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=rust-discord-overlay
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight Discord voice/text overlay for Linux (Wayland, GTK4 layer-shell), written in Rust"
arch=('x86_64')
url="https://github.com/deddroid/rust-discord-overlay"
license=('GPL-3.0-only')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
    'openssl'
    'pango'
)
makedepends=('cargo' 'librsvg')
optdepends=('libpulse: sync system mic/speaker mute with Discord (pactl)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5aac1835cc98cacd316b38aa916bb9b649f26d9ec53254347df4f31975f8b0c5')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    for size in 16 32 48 64 128 256; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w "$size" -h "$size" assets/icon.svg \
            -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done

    install -Dm644 "assets/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
