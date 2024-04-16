# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=atac
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple API client (postman like) in your terminal"
arch=('x86_64')
url="https://github.com/Julien-cpsn/ATAC"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('41e615ba171237ce08f688e299671a22e6930b3a0dbaa32df042ef3e1023515017a1dcaf4c7dd518adb8eaddbb5d3020d6780099720dd3de0217a63b197c96d4')
options=('!lto')

prepare() {
  cd "${pkgname^^}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname^^}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${pkgname^^}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname^^}-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
