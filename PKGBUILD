# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=sniffnet
pkgver=1.1.0
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
sha512sums=('ea30985e46dc97a605b6495a1fdca6518ad5adc084a505fc9fb61a459b896fe16b881fefe0741037249b34f29805495b079f56595ed313c2ab2f17b31fbe9521')

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
