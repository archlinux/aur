# Maintainer: kyrella <arch at kyrella dot xyz>
pkgname=wgpu-native-git
_pkgname=wgpu-native
pkgdesc="Native WebGPU implementation based on wgpu-core"
url="https://github.com/gfx-rs/wgpu-native"
pkgver=v27.0.2.0.r5
pkgrel=1
makedepends=('rust' 'cargo' 'clang' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT OR Apache-2.0')
provides=("wgpu-native=${pkgver}")
source=('git+https://github.com/gfx-rs/wgpu-native.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # cargo build --frozen --release --all-features
  make lib-native-release
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$_pkgname"
  # install -Dm0755 "target/release/libwgpu_native.so" "$pkgdir/usr/lib/libwgpu_native.so.${pkgver#v}"
  install -Dm0755 -t "$pkgdir/usr/lib" "target/release/libwgpu_native.so"
  install -Dm0755 -t "$pkgdir/usr/include/libwgpu-native" "ffi/webgpu-headers/webgpu.h"
  install -Dm0755 -t "$pkgdir/usr/include/libwgpu-native" "ffi/wgpu.h"
}
