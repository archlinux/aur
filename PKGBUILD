# Maintainer:

pkgname=ripsecrets
pkgver=0.1.3
pkgrel=1
pkgdesc='A command-line tool to prevent committing secret keys into your source code'
arch=('x86_64')
url='https://github.com/sirwart/ripsecrets'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='388e7b4c8d584bcd4392994885bcb277c91ec5c2'
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
