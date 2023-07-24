# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.5.0-alpha.8
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
sha512sums=('18a4f807147947908ead460d68b50808d4a6ea415daa1efc1910a6276e8785447400b74d8f54be44c2d8094b2888d484c15017ee198a1d18f5dca1e55c5df134')
b2sums=('8b9be3101782a40a824e007c2d57a71cb78a1be09fc54135d0d11847fd6f40dc5dc20f8e461e532dfff37bf2c4245b2b5fe2802e9c720c58f6ad0c0ab698179f')

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
