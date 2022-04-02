# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctave
pkgver=0.4.2
pkgrel=1
pkgdesc="A batteries-included developer documentation site generator"
arch=('x86_64')
url="https://www.doctave.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='ad1888feb6bb7f4f043b76474b1df38b520c51c3'
source=("$pkgname::git+https://github.com/Doctave/doctave.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/doctave

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
