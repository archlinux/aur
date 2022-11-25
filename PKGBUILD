# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=licensure
pkgver=0.3.0
pkgrel=1
pkgdesc='A software license header and copyright management tool'
arch=('x86_64')
url='https://github.com/chasinglogic/licensure'
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
_commit='a6d276022eb0b638316707f1c55edb79cba33082'
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

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
