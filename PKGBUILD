# Maintainer: Matteo Giordano <mail at matteogiordano dot com>

pkgname=lla
pkgver=0.3.2
pkgrel=1
pkgdesc='A modern alternative to ls'
url='https://github.com/triyanox/lla'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto')
sha512sums=('ab2b904c07e10bdb2e7cfef334831f8fc498a2f4f70aa009d3c7e3b64a3de75398a13d0bf950cb110b1b0c632a87e4eae7d17c477689615ee9f5d3f2d47535b2')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
