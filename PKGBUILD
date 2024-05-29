# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite
pkgver=0.3
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
  xorg-server-xwayland
)
makedepends=(
  clang
  rust
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('7ce0fe4d8611881f788d7c253d584700c9eb733af8a66a7602e1e78efdeac1f33af04a23a1ba6b674e07e2a8eac2ed15876aa2e39fa946bd2da4412f5eb45229')

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
