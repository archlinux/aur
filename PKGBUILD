# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=librofd-ffi
pkgver=0.4.0
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/rofd/archive/refs/tags/v$pkgver.tar.gz"
        "rofd-ffi-page-size.patch")
sha256sums=('7834fb1156049b0a409a5722e6b54a31c511a4ef3c301f10913dbc495fc738ac'
            '812bebb544844164d0004f9854fde1714aa9da97b4fa9ff8d0fa6a8eea96564d')

# the archive of the v$pkgver tag extracts to rofd-$pkgver
_dirname="rofd-$pkgver"

prepare() {
  cd "$_dirname"
  # 临时携带：上游 PR linuxdeepin/rofd#11 —— 元数据式页尺寸查询
  # rofd_document_get_page_size_mm；合入正式版本后删除本行与 source 项
  patch -Np1 -i "$srcdir/rofd-ffi-page-size.patch"
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
