# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=sniffnet
pkgver=1.1.1
pkgrel=1
pkgdesc="Application to comfortably monitor your network traffic"
arch=('x86_64')
url="https://github.com/GyulyVGC/$pkgname"
license=('Apache' 'MIT')
depends=('alsa-lib' 'fontconfig' 'libpcap')
makedepends=('cargo')
options=('!lto')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e76fa0663288f764f599ee9e69b5ba4207a928869ff36e09ff7beba42598f398f0292fa9db0bdced367a1792a7308c5408f6afa379900b4d2dd03ab2bf5da76c')

prepare() {
    cd "$pkgname-$pkgver"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
