# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=suppaftp
pkgver=4.2.0
pkgrel=1
pkgdesc="A super FTP/FTPS command-line interface"
arch=('x86_64')
url="https://github.com/veeso/suppaftp"
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
options=('!lto')
_commit='63a6cc3b254ceaaa75d3dce6ada991edb0cd5a8c'
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

  cargo build --frozen --release --features="secure cli-bin"
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" target/release/suppaftp

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
