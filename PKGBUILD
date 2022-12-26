# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.4.0-beta.9
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='A simple image hosting service'
arch=('x86_64')
url='https://crates.io/crates/pict-rs'
license=('AGPL3')
depends=(
  'gcc-libs'
  'imagemagick'
  'ffmpeg'
  'perl-image-exiftool'
)
makedepends=('rust' 'protobuf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('02cceabc9c7dbf21e48b3bbca5e60481a1b4438284ca687f6a370b61a8489ecd3abf449b1663a1ee5f63e170dc600264fe9ceaef387a6cf85539cbf878a81c89')
b2sums=('e32e97313d5995e516c35b5f86a25993a4bb13c22910e8df9098271fcb2f3982a3d39d3db77c26ddac8860d2aacce2adfa2a66f7c7bb7e70681d36b96b51c985')

prepare() {
  cd "$pkgname-$_pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_pkgver"

  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$_pkgver"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$_pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md ./*.toml
  cp -vr client-examples "$pkgdir/usr/share/doc/$pkgname"
}
