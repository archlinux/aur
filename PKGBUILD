# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-checkmate
pkgver=0.1.7
pkgrel=1
pkgdesc="Perform a series of useful checks out of the box"
arch=('x86_64')
url="https://github.com/nathan-at-least/cargo-checkmate"
license=('MIT')
depends=('zlib' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  'LICENSE'
)
b2sums=('317433d3b1c38396fb387d75c7208f6bc1ff072f23cfd9cd4fa0a0ab051688fcb0e2eb79f98597d8c2a58ca23927ac489a9e0119973070f271346659965a62e2'
        '41c0f3c653eba534c8c3988550fcd90bd5c23cf1747ef80f67f2affd14ba6f2f824d825a507eb792f77e906275bbdc2efac41096d73326ddc85857a63b30abfe')

prepare() {
  # download dependencies
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
