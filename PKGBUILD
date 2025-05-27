# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=ripsecrets
pkgver=0.1.10
pkgrel=1
pkgdesc='A command-line tool to prevent committing secret keys into your source code'
arch=('x86_64')
url='https://github.com/sirwart/ripsecrets'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='f81b55ac929cdbdb6739469099ba9aebd5af5a6a'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname" || exit

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname" || exit

  cargo build --frozen --release
}

check() {
  cd "$pkgname" || exit

  cargo test --frozen
}

package() {
  cd "$pkgname" || exit

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
