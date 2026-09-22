# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=wgpu-native
pkgver=29.0.1.1
pkgrel=1
pkgdesc='Native WebGPU implementation based on wgpu-core'
arch=(
  x86_64
  aarch64
)
url=https://github.com/gfx-rs/wgpu-native
license=(
  MIT
  Apache-2.0
)
depends=(
  gcc-libs
  glibc
  vulkan-icd-loader
  vulkan-driver
)
makedepends=(
  cargo
  clang
)
provides=(
  libwgpu_native.so
  webgpu-headers
)
conflicts=(
  webgpu-headers
  webgpu-headers-git
)
options=(staticlibs)
_headers_commit=673658bc2bd70ec39fc55ebe6bb0173cf6d0a603
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  webgpu-headers-$_headers_commit.tar.gz::https://github.com/webgpu-native/webgpu-headers/archive/$_headers_commit.tar.gz
)
sha256sums=(
  6008651e1d10022d4ded15b69405b4ba88577be5d623938ba98ad241b2cbf818
  6754c6c2465c79a954f7c04c7890c9f00b7ecce8addbe01b5056e860ba3933e6
)

prepare() {
  cd $pkgname-$pkgver
  rm -rf ffi/webgpu-headers
  cp -r "$srcdir"/webgpu-headers-$_headers_commit ffi/webgpu-headers

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export WGPU_NATIVE_VERSION=v$pkgver
  cargo build --release --frozen
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 target/release/libwgpu_native.so -t "$pkgdir/usr/lib"
  install -Dm644 target/release/libwgpu_native.a -t "$pkgdir/usr/lib"

  install -Dm644 ffi/webgpu-headers/webgpu.h -t "$pkgdir/usr/include/webgpu"
  install -Dm644 ffi/wgpu.h -t "$pkgdir/usr/include/webgpu"

  install -dm755 "$pkgdir"/usr/lib/pkgconfig
  cat >"$pkgdir"/usr/lib/pkgconfig/$pkgname.pc <<EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: $pkgname
Description: $pkgdesc
Version: $pkgver
Libs: -L\${libdir} -lwgpu_native
Cflags: -I\${includedir} -I\${includedir}/webgpu
EOF

  ln -s $pkgname.pc "$pkgdir"/usr/lib/pkgconfig/wgpu_native.pc
  ln -s $pkgname.pc "$pkgdir"/usr/lib/pkgconfig/wgpu.pc

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE.MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.MIT
  install -Dm644 LICENSE.APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.APACHE
}
