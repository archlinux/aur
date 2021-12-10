# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy
pkgver=0.14.5
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
sha512sums=('36907754b7e3b04bdb599858dafdde2500090a385bd0b3a3626e1e4d5ed6faaad5c907ca03776314b81d9d087937ffa13b9714f7ce2ea99177fa6af6030e24ca')
b2sums=('492ad49575ba0b1821124d3c380c21b68eebd29f04e6e5f9aaf645552a0eafdbbc4db5788698bc66b5374637aefbca9007afd2e8af9ed51654f905a05032bd2b')

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
