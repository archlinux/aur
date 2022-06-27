# Maintainer:

pkgname=ripsecrets
pkgver=0.1.5
pkgrel=1
pkgdesc='A command-line tool to prevent committing secret keys into your source code'
arch=('x86_64')
url='https://github.com/sirwart/ripsecrets'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='bffab8f67a008e845108f037eb9bf7e9c52da54f'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

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

  cargo build --frozen --release
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
