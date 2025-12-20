# Maintainer: wayscriber maintainers <hyprarcher@proton.me>
pkgname=wayscriber-configurator
pkgver=0.9.3
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
    'git'
)
optdepends=(
    'wayscriber: integrate with the running daemon and CLI'
)
source=("git+https://github.com/devmobasa/wayscriber.git#tag=v0.9.3")
sha256sums=('SKIP')

prepare() {
    cd wayscriber
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --manifest-path configurator/Cargo.toml --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd wayscriber
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bins --manifest-path configurator/Cargo.toml
}

package() {
    cd wayscriber

    install -Dm755 "target/release/wayscriber-configurator" "$pkgdir/usr/bin/wayscriber-configurator"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
