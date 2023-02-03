# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=codeberg-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI tool for Codeberg'
arch=('x86_64')
url='https://codeberg.org/RobWalt/codeberg-cli'
license=('AGPL3')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
_commit='da32e4d4a3e9510c6b1ad609ece522f71691b201'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'Cargo.lock'
)
b2sums=('SKIP'
        '038bad4d6ca321d712c0c259babf46cbd2d58c9cd71e694b6fe332a065f7bddada876fcf780f03f7988584ddd1b346126f6f8639984050d535a65d59f1387f62')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # use updated lockfile
  cp -vf "$srcdir/Cargo.lock" .

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

#check() {
#  cd "$pkgname"
#
#  cargo test --frozen --all-features
#}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/cod
}
