# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=xiu
pkgver=0.12.4
pkgrel=1
pkgdesc='Simple, fast and secure live media server in pure Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/harlanc/xiu'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a07904068e95f3ceff6719b5de809383fdd4b388e89841a341425a780dac183d')

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
