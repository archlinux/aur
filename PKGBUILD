# Maintainer: wayscriber maintainers <hyprarcher@proton.me>
pkgname=wayscriber-configurator
pkgver=0.9.18
pkgrel=1
pkgdesc='GUI configurator for wayscriber (Iced)'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
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
sha256sums=('f92cfbb4b56d232c5f64ad3c36208a864ff35aedf9a2fb69f36f6fdac28dc9a6')

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
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
