# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.6.0
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('866db3b8da6d03abb0eddf225a934051442573ac670e78629073a6a32036e1ed497041fa3bab91007b84898846dd1f7a12a9938472fbb3784df31b241ab9af29')
options=('!lto')

prepare() {
  cd "$pkgname-rs-$pkgver/crates/$pkgname-cli"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-rs-$pkgver/crates/$pkgname-cli"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-rs-$pkgver/crates/$pkgname-cli"
  cargo test --frozen
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
