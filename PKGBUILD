# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>

pkgname=cdwifi
pkgver=0.1.3
pkgrel=1
epoch=1
pkgdesc="Simple login script for public wifi in ČD trains"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/MaximMaximS/CDWiFi"
license=('MIT')
depends=("openssl" "glibc")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=("ae9739c66aad7584d869b4906e8660c6454b25071b67235bab9499b110fb7408fc9e298f6632813d1ab231bac73a3b803b8e8b2d2c063aae6fe869622b6fd19f")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    cargo test --release --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/$pkgname"
}
