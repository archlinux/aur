# Maintainer: Alexander Minges <alexander dot minges at gmail dot com>
pkgname=libghostty-vt
pkgver=1.0.0
pkgrel=4
pkgdesc='portable, high-performance C library for terminal emulation'
arch=(x86_64 aarch64)
url='https://lib.ghostty.org/vt/'
depends=(glibc)
conflicts=(ghostty)
provides=(ghostty)
license=(MIT)
makedepends=(zig)
source=("https://release.files.ghostty.org/libghostty-vt/$pkgver/libghostty-vt-$pkgver.tar.gz"
        "https://release.files.ghostty.org/libghostty-vt/$pkgver/libghostty-vt-$pkgver-deps.tar.gz")
sha256sums=('4a6ef758be721923e1969e7b81b443dcc92d8dd3fb5a39600c03a8817a753676'
            '4d5ea5e448e4c7ea8fb55ccbaa8668f2a97d44f438cee831e2b7ecd162d85c29')

build() {
  cd libghostty-vt-$pkgver
  rm -rf "$srcdir/stage"
  # --system keeps Zig offline; the deps tarball holds every package.
  ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache" DESTDIR="$srcdir/stage" \
    zig build --prefix /usr --system "$srcdir/libghostty-vt-$pkgver-deps" \
      -Doptimize=ReleaseFast -Dcpu=baseline
}

package() {
  cp -a "$srcdir/stage/usr" "$pkgdir/"
  install -Dm644 "libghostty-vt-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Drop static libs and the metadata pointing at them.
  rm "$pkgdir/usr/lib/libghostty-vt.a" "$pkgdir/usr/lib/pkgconfig/libghostty-vt-static.pc"
  sed -i '/^# Static library target$/,/^endif()$/d' \
    "$pkgdir/usr/lib/cmake/ghostty-vt/ghostty-vt-config.cmake"
}
