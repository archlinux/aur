# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber
pkgver=0.9.24
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
    'gtk4'
    'gtk4-layer-shell'
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
sha256sums=('67615fb0764683ca119bb301c505f7f7c6dadedee38f76438dc41a73fdc8bbaa')

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
