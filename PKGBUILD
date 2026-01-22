# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=parui
pkgver=1.0.19
pkgrel=1
pkgdesc="Simple TUI frontend for paru or yay"
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
  'yay: alternative AUR interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d2e15bb7d26d7aa3ea0764c8020bebb16d9ef2da41fef576ce40fa74f5f4ff917cbdcd7d8fabb38c4817dfb16f173d593a265740846c8c3bb381db810dc86347')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  CFLAGS+=" -ffat-lto-objects" cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
