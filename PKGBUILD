# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reshape
pkgver=0.5.1
pkgrel=1
pkgdesc="A zero-downtime schema migration tool for PostgreSQL"
arch=('x86_64')
url="https://github.com/fabianlindfors/reshape"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='7be40f2b29aa8d1170e8d3d3a4222f91fc5d19d0'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
