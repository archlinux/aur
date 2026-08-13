# Maintainer: wayscriber maintainers <hyprarcher@proton.me>
pkgname=wayscriber-configurator
pkgver=0.9.24
pkgrel=1
pkgdesc='GUI configurator for wayscriber (GTK4/libadwaita)'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'gtk4'
    'libadwaita>=1.4'
    'gcc-libs'
    'glibc'
    'libxkbcommon'
)
makedepends=(
    'cargo'
)
optdepends=(
    'wayscriber: integrate with the running daemon and CLI'
)
source=("wayscriber-$pkgver.tar.gz::https://github.com/devmobasa/wayscriber/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67615fb0764683ca119bb301c505f7f7c6dadedee38f76438dc41a73fdc8bbaa')

prepare() {
    cd "wayscriber-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --manifest-path configurator/Cargo.toml --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "wayscriber-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bins --manifest-path configurator/Cargo.toml
}

package() {
    cd "wayscriber-$pkgver"

    install -Dm755 "target/release/wayscriber-configurator" "$pkgdir/usr/bin/wayscriber-configurator"

# Wayscriber configurator desktop integration
    install -Dm644 packaging/wayscriber-configurator.desktop "$pkgdir/usr/share/applications/wayscriber-configurator.desktop"
    install -Dm644 packaging/icons/wayscriber-configurator-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-19.png "$pkgdir/usr/share/icons/hicolor/19x19/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-22.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-38.png "$pkgdir/usr/share/icons/hicolor/38x38/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/wayscriber-configurator.png"
    install -Dm644 packaging/icons/wayscriber-configurator.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wayscriber-configurator.svg"
    install -Dm644 packaging/icons/wayscriber-configurator-128.png "$pkgdir/usr/share/pixmaps/wayscriber-configurator.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
