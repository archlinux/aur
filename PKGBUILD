# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=onagre
pkgver=1.1.1
pkgrel=1
pkgdesc="General purpose application launcher for X and Wayland inspired by Rofi/Wofi and Alfred"
arch=(x86_64)
url="https://github.com/$pkgname-launcher/$pkgname"
license=(MIT)
depends=(
  gcc-libs
  glibc
  pop-launcher
  vulkan-driver
)
makedepends=(rust)
options=(!debug !lto)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('53172d6fbbc1299e215d4bd333d5e190a357b7adf01f8ec3357d06f1045243f6b620b813a21049f1a6e8835e9650342c2580e0ec984dedcd57a09bf6c72a4269')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
