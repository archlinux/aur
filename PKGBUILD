# Maintainer:

pkgname=ripsecrets
pkgver=0.1.8
pkgrel=1
pkgdesc='A command-line tool to prevent committing secret keys into your source code'
arch=('x86_64')
url='https://github.com/sirwart/ripsecrets'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='bffab8f67a008e845108f037eb9bf7e9c52da54f'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4d7209605d3babde73092fed955628b0ecf280d8d68633b9056d2f859741109d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || exit

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit

  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver" || exit

  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
