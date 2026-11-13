# Maintainer: Alexander Minges <alexander dot minges at gmail dot com>
pkgname=libghostty-vt
pkgver=1.0.1
pkgrel=1
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
sha256sums=('333dfce97641ef9b536bb9e08907ad86abaaada50e8f7417b70d9284adef37aa'
            '91a4e10960a52bf5bf4b15aa2a2cddaff8a89d6cd903d3055bda4fd17de3356d')

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
