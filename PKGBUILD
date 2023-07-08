# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.4.0-rc.14
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
sha512sums=('a6e1305a020c664bed8d0b4fe8a69f3cfdd97a87c56db855de3f1a5f258caedcf5a9935c6fc2e394cab35a5eb212728eb64127aa1162b82f21ca160a1489872b')
b2sums=('be813ca4040a8a74ce7fde50ffec4046f19f7d0bf0f14dae1928f04801ed34d91a073df790ed2b054911c34ad325f9eadcd2ba08f56fe63dad38920c7b58478c')

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
