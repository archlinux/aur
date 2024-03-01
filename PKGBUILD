# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bluetui
pkgver=0.2
pkgrel=2
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64')
url="https://github.com/pythops/bluetui"
license=('GPL3')
depends=('gcc-libs' 'dbus' 'bluez')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4b7c3707dd203e403faabe65fbb73061a9b708677d01f5f965d22e361415dc7a58ecb46d3100b28daf0fd5685e6b695359a110ab5c8a9b708d7e37dc530c4ecf')

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
