# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.5.0-alpha.3
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
sha512sums=('ceca3a4b67a5fc00c64352735393044eb076a8f3b5c86fe5bf3033ccf9b4a11ba618c8ab7de6de95c914fddc8c76578c93af5981bb1c1ebc283802fcc70a1965')
b2sums=('56bd337de737659d230b03154e9b8d0abc876b27dd2c9bb7bd22c55f6f56ec3623a5233931821f1aee40d0828b3ba04de19d5d99b423f5629a8dba37a7583255')

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
