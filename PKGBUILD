# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy
pkgver=0.14.1
pkgrel=1
pkgdesc="A link aggregator for the fediverse"
arch=('x86_64')
url="https://join-lemmy.org"
license=('AGPL3')
depends=('gcc-libs' 'openssl' 'postgresql-libs')
makedepends=('rust')
optdepends=(
  'lemmy-ui: for the web app'
  'pict-rs: for image hosting backend'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LemmyNet/lemmy/archive/$pkgver.tar.gz")
sha512sums=('4e2656f0302751bb2e8eab4e6ac96f98c22bb144e496940ba207f564cf95b76d69d2a672edf5bc1a19eba11d9e77f1c78c6708c3505f1a7b7b84f2da54ca2fe8')
b2sums=('72d0c6c9bff0826cc83b3aef8a0373af79929e1fe29139790d40aad69dbd516d64ab33af5b2a869c7584c6c3851d5a6628676c6e062a435411292cd0cbcad03d')

prepare() {
  cd "$pkgname-$pkgver"

  # set version
  sed -i "s/unknown version/$pkgver/" crates/utils/src/version.rs

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/lemmy_server
}
