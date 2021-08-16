# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-checkmate
pkgver=0.1.6
pkgrel=1
pkgdesc="Perform a series of useful checks out of the box"
arch=('x86_64')
url="https://github.com/nathan-at-least/cargo-checkmate"
license=('MIT')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  'LICENSE'
)
b2sums=('0a69224e62ec22b2eea3017c7edbe9e31e43e93fc845222755ec209814bcf66d55052e15dfef73619fc3c7324f3e0983ecfbb73762b688259271ea374621b91a'
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
