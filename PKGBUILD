# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber
pkgver=0.9.18
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'libxkbcommon'
    'gcc-libs'
    'glibc'
    'wl-clipboard'
    'grim'
    'slurp'
)
makedepends=(
    'cargo'
)
optdepends=(
    'wayscriber-configurator: GUI configurator (F11)'
)
conflicts=('wayscriber-debug<0.8.6')
replaces=('wayscriber-debug')
source=("wayscriber-$pkgver.tar.gz::https://github.com/devmobasa/wayscriber/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f92cfbb4b56d232c5f64ad3c36208a864ff35aedf9a2fb69f36f6fdac28dc9a6')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin wayscriber
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/wayscriber" "$pkgdir/usr/bin/wayscriber"

    install -Dm644 packaging/wayscriber.service "$pkgdir/usr/lib/systemd/user/wayscriber.service"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
