# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=backseat-signed
pkgver=0.1.0
pkgrel=3
pkgdesc='Authenticate cryptographic links from a signed derivate to its source input.'
url="https://crates.io/crates/$pkgname"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gcc-libs'  'glibc' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('2b0ed792ea4e360a4c7bd94c9795d7731e995c41e8434673e52b39264d5f15cbb4ab10c450bf65793087483f0ba1f4bf678e9705ab64c9ec4575cf4fad3b5606')

prepare() {
  cd $pkgname-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/$pkgname
}
