# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=parui
pkgver=1.0.18
pkgrel=2
pkgdesc="Simple TUI frontend for paru or yay"
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
  'yay: alternative AUR interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6652313edbfef499c6d7810ecf14c85e88c7647137958d0b9350a50e34b79a0cc4c161fec0f671fc6cea259f8cd78d8030c2021229125aea121f120d1cbc2318')

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
