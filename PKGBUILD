# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=aq
pkgver=0.3.0
pkgrel=1
pkgdesc='Like jq, but for JSON, TOML & YAML'
arch=('x86_64')
url='https://github.com/rossmacarthur/aq'
license=('Apache' 'MIT')
depends=('jq')
makedepends=('git' 'rust')
options=('!lto')
_commit='73bc5323fddb079734a90d7e0baa6d5b9aa176c4'
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

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
