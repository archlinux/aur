# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.0.10
pkgrel=1
pkgdesc='An array-oriented stack programming language'
arch=('x86_64')
url='https://www.uiua.org'
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib')
makedepends=('git' 'rust')
options=('!lto')
_commit='0a9f202bd0e2796c1f49378676f28caef2e9d6d1'
source=("$pkgname::git+https://github.com/uiua-lang/uiua#commit=$_commit")
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

  cargo build --frozen --release --features audio
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
