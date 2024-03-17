# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=xiu
pkgver=0.12.5
pkgrel=1
pkgdesc='Simple, fast and secure live media server in pure Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/harlanc/xiu'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2a5221310f68d99ac3aa4a6c90b95287b230adc0967d76eb875763c5cba61196')

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
