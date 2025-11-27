# Maintainer: wayscriber maintainers <hyprarcher@proton.me>
pkgname=wayscriber-configurator
pkgver=0.8.6
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
source=("git+https://github.com/devmobasa/wayscriber.git#tag=v0.8.6")
sha256sums=('a815b981fa615dfeca9b59a2ef2408d8f44358f1a19bf2ae8bfb0afaff03f2b9')

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
