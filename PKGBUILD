# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bytehound
pkgver=0.11.0
pkgrel=1
pkgdesc='A memory profiler for Linux'
arch=('x86_64')
url='https://github.com/koute/bytehound'
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rustup' 'yarn' 'node-gyp')
options=('!lto')
_commit='acce3bce127705ea8c840767ed351229a3c2738c'
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

  cargo build \
    --frozen \
    --release \
    --all-features \
    --package bytehound-preload \
    --package bytehound-cli
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # shared lib
  install -vDm755 -t "$pkgdir/usr/lib" "target/release/lib$pkgname.so"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md ./*.png
}
