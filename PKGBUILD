# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=xiu
pkgver=0.12.6
pkgrel=1
pkgdesc='Simple, fast and secure live media server in pure Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/harlanc/xiu'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ccb5c8bfd35d2ccf474ab7c324e975d675aef56b9a0588dfee286fcb9968efad')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

    install -Dm 644 README.md README_CN.md \
        -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 644 protocol/webrtc/src/clients/index.html \
        protocol/webrtc/src/clients/whep.js \
        -t "$pkgdir/usr/share/$pkgname"
}
