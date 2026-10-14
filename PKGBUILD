# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=librofd-ffi
pkgver=0.4.0
pkgrel=1
pkgdesc='Stable C ABI for the rofd OFD parser and renderer'
arch=(x86_64)
url='https://github.com/linuxdeepin/rofd'
license=(LGPL-2.1-or-later)
depends=(
  cairo
  freetype2
  glibc
  gcc-libs
  jbig2dec
)
makedepends=(
  cargo
  rust
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/rofd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7834fb1156049b0a409a5722e6b54a31c511a4ef3c301f10913dbc495fc738ac')

# the archive of the v$pkgver tag extracts to rofd-$pkgver
_dirname="rofd-$pkgver"

prepare() {
  cd "$_dirname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_dirname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package rofd-ffi
}

package() {
  cd "$_dirname"
  install -Dm755 "target/release/librofd_ffi.so" "$pkgdir/usr/lib/librofd_ffi.so.0"
  ln -s librofd_ffi.so.0 "$pkgdir/usr/lib/librofd_ffi.so"
  install -Dm644 crates/rofd-ffi/include/rofd.h -t "$pkgdir/usr/include/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
