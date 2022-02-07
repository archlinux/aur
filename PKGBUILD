# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-checkmate
pkgver=0.1.10
pkgrel=1
pkgdesc="Perform a series of useful checks out of the box"
arch=('x86_64')
url="https://github.com/nathan-at-least/cargo-checkmate"
license=('MIT')
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('git' 'rust')
options=('!lto')
_commit='36bd61c0e6c4b950babec8b578805a540ba24059'
source=("$pkgname::git+https://github.com/nathan-at-least/cargo-checkmate.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --release --frozen
}

check() {
  cd "$pkgname"

  cargo test --frozen
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

}
