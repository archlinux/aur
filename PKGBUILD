# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bluetui
pkgver=0.4
pkgrel=1
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64')
url="https://github.com/pythops/bluetui"
license=('GPL3')
depends=('gcc-libs' 'dbus' 'bluez')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('696959b9e5b48e214599e217ad9d7e75441f50ebc38790b6fb31982afa913e4aa26bd9247cb1d1e74ca20681984ec4260970e09530566f7d8e2b1cee3d83c58f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
