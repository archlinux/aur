# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy
pkgver=0.14.3
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
sha512sums=('79b4a87f0ca2e033d635f7a2bbb87da23b4f5dddc5c362e0d737454fab5166fb971a335fb7ef398ead4b524d667473d33561a10a10aa71dc9649c94941c70814')
b2sums=('6668845b6d1f94c7c7d46af47de5a8dbe6f3dea844c000216196b17fa370da5f85b6dad6ca46bc027c40b0e66a0010f8b7af6873bbcf0ffa6c5cbe1ba715c607')

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
