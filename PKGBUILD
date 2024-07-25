# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bluetui
pkgver=0.5
pkgrel=1
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64')
url="https://github.com/pythops/bluetui"
license=('GPL3')
depends=('gcc-libs' 'dbus' 'bluez')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f34b16c9defd142c635a94948cdb2718a98361078edd26b4edb78710483deb3f30f0eb82523c50f04e88365712e46b94f18de670fb95c1c69e14c7cac886b336')

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
