# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=suppaftp
pkgver=5.2.0
pkgrel=1
pkgdesc='A super FTP/FTPS command-line interface'
arch=('x86_64')
url='https://github.com/veeso/suppaftp'
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
options=('!lto')
_commit='5bf40b4bc68658180bdfe7c54cae5d9869c64ae6'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features --package suppaftp-cli
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
