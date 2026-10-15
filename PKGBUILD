# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=librofd-ffi
pkgver=0.4.3
pkgrel=5
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
_commit=140b936d1b3f33a9adeda9fb6f428016b735d9a0   # 0.4.3 on main; upstream published no v0.4.3 tag
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/rofd/archive/$_commit.tar.gz"
        "rofd-ffi-page-size.patch"
        "rofd-ffi-font-advances.patch"
        "rofd-ffi.pc.in")
sha256sums=('0d6300fb28507f0597e2aa10d3822df3519e630fbf820fd95164df0ba8e3ce38'
            '812bebb544844164d0004f9854fde1714aa9da97b4fa9ff8d0fa6a8eea96564d'
            '108062dae1afa9484708ee42128386c983169c95c954b096f4b27c8fbf8d1d80'
            'cf912f767bb51933051144c074600f008c48cf694489630db52cd1edbb7bf538')

# the archive of $_commit extracts to rofd-$_commit
_dirname="rofd-$_commit"

prepare() {
  cd "$_dirname"
  # Temporarily carried: upstream PR linuxdeepin/rofd#11 — metadata-only page
  # size query rofd_document_get_page_size_mm. Drop this line and the source
  # entry once a release contains it (see papers-ofd/patches/README.md).
  patch -Np1 -i "$srcdir/rofd-ffi-page-size.patch"
  # Temporarily carried: upstream PR linuxdeepin/rofd#13 — text runs without an
  # explicit DeltaX take their advances from the resolved font and their character
  # boxes span that glyph's painted extents, so page geometry, search rectangles and
  # selection regions match the rendered glyphs. Drop this line and the source entry
  # once a release contains it (see papers-ofd/patches/README.md).
  patch -Np1 -i "$srcdir/rofd-ffi-font-advances.patch"
}

build() {
  cd "$_dirname"
  # 0.4.1 onwards vendors every crate and sets net.offline = true in
  # .cargo/config.toml, so --frozen builds without touching the network.
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package rofd-ffi
}

package() {
  cd "$_dirname"
  install -Dm755 "target/release/librofd_ffi.so" "$pkgdir/usr/lib/librofd_ffi.so.0"
  ln -s librofd_ffi.so.0 "$pkgdir/usr/lib/librofd_ffi.so"
  install -Dm644 crates/rofd-ffi/include/rofd.h -t "$pkgdir/usr/include/"
  # pkg-config metadata for the C ABI, so consumers (papers-ofd today, upstream
  # Papers after the phase-4 move) can use dependency('rofd-ffi') instead of
  # hardcoding a build directory. rofd has no install system upstream; this
  # package installs the file.
  install -d "$pkgdir/usr/lib/pkgconfig"
  sed "s/@VERSION@/$pkgver/" "$srcdir/rofd-ffi.pc.in" > "$pkgdir/usr/lib/pkgconfig/rofd-ffi.pc"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
