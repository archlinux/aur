# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=r1249.g1ec1901
pkgrel=1
pkgdesc='An array-oriented stack programming language'
arch=('x86_64')
url='https://www.uiua.org'
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib')
makedepends=('git' 'rust')
options=('!lto')
_commit='1ec1901eae24f75343af2ae02df36b5dc131c8ba'
source=("$pkgname::git+https://github.com/uiua-lang/uiua#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" readme.md
  cp -vr site "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" license
}
