# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=kondo
pkgver=0.6
pkgrel=1
pkgdesc='Save disk space by cleaning non-essential files from software projects'
arch=('x86_64')
url='https://github.com/tbillington/kondo'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='e936c3a2c21fe995143c049af225145a38daba87'
source=("$pkgname::git+$url#commit=$_commit")
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

  cargo build --frozen --release --all-features
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
