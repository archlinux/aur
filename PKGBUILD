# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=librofd-ffi
pkgver=0.4.3.fork.1
pkgrel=1
pkgdesc='Stable C ABI for the rofd OFD parser and renderer'
arch=(x86_64)
url='https://github.com/YangtseSu/rofd'
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
# The fork's release branch. It carries the changes papers-ofd relies on
# (page-size query, font-resolved text advances, image decode budget) plus the
# pkg-config metadata, proposed upstream as PRs #11–#14. Retire this package in
# favour of an upstream-built one once a linuxdeepin/rofd release contains all
# of them (see papers-ofd/patches/README.md).
_tag=v0.4.3-fork.1
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/rofd/archive/refs/tags/$_tag.tar.gz")
sha256sums=('b19a464ea34bab6b6260221dd9900247bd8cc581c49e5afff95a8a19f05681dd')

# GitHub strips the tag's leading v; pkgver differs only in dots
_dirname="rofd-0.4.3-fork.1"

prepare() {
  cd "$_dirname"
  true
}

build() {
  cd "$_dirname"
  # the release tarball vendors every crate and sets net.offline = true in
  # .cargo/config.toml, so --frozen builds without touching the network.
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package rofd-ffi
}

package() {
  cd "$_dirname"
  install -Dm755 "target/release/librofd_ffi.so" "$pkgdir/usr/lib/librofd_ffi.so.0"
  ln -s librofd_ffi.so.0 "$pkgdir/usr/lib/librofd_ffi.so"
  install -Dm644 crates/rofd-ffi/include/rofd.h -t "$pkgdir/usr/include/"
  # pkg-config metadata for the C ABI, shipped in the fork source tree
  # (debian/rofd-ffi.pc.in, upstream PR #12). Consumers (papers-ofd today,
  # upstream Papers after the phase-4 move) can use dependency('rofd-ffi')
  # instead of hardcoding a build directory. libdir uses @MULTIARCH@ in the
  # Debian template; Arch has no multiarch, so substitute /usr/lib.
  install -d "$pkgdir/usr/lib/pkgconfig"
  sed -e "s/@VERSION@/$pkgver/" -e 's|/lib/@MULTIARCH@|/lib|' \
      debian/rofd-ffi.pc.in > "$pkgdir/usr/lib/pkgconfig/rofd-ffi.pc"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
