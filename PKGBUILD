# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.4.0-rc.8
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
sha512sums=('0888a00b920c886e43dce081cdd667352e94549d60d7c38db35acbc194d619fb93a8e15ee94e6a679d3e376284467c3d8023e9a4354f23672e71fec6897783e5')
b2sums=('7ec1b79d81843c6d76013ecd2f5f724110092c672f8f98816a8ba8d8341f2f652caac56529e749f1698878c392e2d3fef7b1741cfae02ad4af819d625435565e')

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
