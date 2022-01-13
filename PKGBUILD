# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy
pkgver=0.15.1
pkgrel=1
pkgdesc="A link aggregator for the fediverse"
arch=('x86_64')
url="https://join-lemmy.org"
license=('AGPL3')
depends=('gcc-libs' 'openssl' 'postgresql-libs')
makedepends=('git' 'rust')
optdepends=(
  'lemmy-ui: for the web app'
  'pict-rs: for image hosting backend'
)
options=('!lto')
_commit='f53902ecff3f8267dd3b39d252bee2bf4cf16f9e'
source=("$pkgname::git+https://github.com/LemmyNet/lemmy.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # set version
  sed -i "s/unknown version/$pkgver/" crates/utils/src/version.rs

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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/lemmy_server
}
