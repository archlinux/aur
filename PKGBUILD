# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite
pkgver=0.1
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
)
makedepends=(
  clang
  rust
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('7e448032a7ac49efb84e274cdd3d8be99c6f1e411b2011a940abc031446fb0991cfd18ff64c8dd652482b5401610c4b7082ddd1f0a8688945ef869831a3622d4')

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
