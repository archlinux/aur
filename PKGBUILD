# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite
pkgver=0.4
pkgrel=1
pkgdesc="Xwayland outside your Wayland"
arch=(x86_64)
url="https://github.com/Supreeeme/$pkgname"
license=(MPL-2.0)
depends=(
  gcc-libs
  glibc
  libxcb
  xcb-util-cursor
  xorg-xwayland
)
makedepends=(
  clang
  rust
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('f0f983a7fd33454c81e52acf00a9fc6b1b93b9380751db02045eb525622bd2540ed01ef202c04076876d07dcd16f87fcabd618fb7fbdc29d19651bcfca5345b0')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  install -vDm755 $pkgname-$pkgver/target/release/$pkgname -t "$pkgdir"/usr/bin/
}
