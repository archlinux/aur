# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.6.1
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL-3.0-only')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-cli-v$pkgver.tar.gz")
sha512sums=('0ff1b88d2f6d26f08716c3ef21783d562900a5e1204a65869ebe8b1579ed2f0f0744b08b9133fa6047f2401ff82c3f432265c30c44d73115ee33b07c12bfaaa0')
options=('!lto')

_cli_srcdir="$pkgname-rs-$pkgname-cli-v$pkgver/crates/$pkgname-cli"

prepare() {
  cd "$_cli_srcdir"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_cli_srcdir"
  cargo build --release --frozen
}

check() {
  cd "$_cli_srcdir"
  cargo test --frozen
}

package() {
  cd "$pkgname-rs-$pkgname-cli-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
