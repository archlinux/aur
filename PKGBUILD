# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.4.0-beta.7
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
sha512sums=('bc280c5cab65939c07877619c2fbaa4251e4831ca9f024bcd495e4ff507fa485e07fe006d878992ea5e99da8b8334335b9df1fff11ca956c1f6c790aedd54249')
b2sums=('ddcb0b113dea1b09fac6ab3d5241575108bb3d84eadfb7ed8e19042fb85f4c3512bec7b8c06af4f531889749395fca0a8176bb3d56be29f5ad9692e5176ffb42')

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
