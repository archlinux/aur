# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.5.0-alpha.0
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
sha512sums=('6bd410f7083468d4067d757658cac170a40f709ac83f378295fd1e1156f83e87c3937f85f4ac328c0d90b00c191dde77f3f341278348892727300162e98e60be')
b2sums=('813138008fcd05305050adeb199b01e8a09a5cf7de82cfbb4dbf7d5543883c4ad69fb617dfc145bb646d5a26ab63500acb2f0bac69a91e2f59d38f8cdf4bd3d5')

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
