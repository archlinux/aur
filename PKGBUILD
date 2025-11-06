# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbacktrace-git
pkgver=r123.g2f67a3a
pkgrel=2
pkgdesc="Library to produce symbolic backtraces"
arch=('i686' 'x86_64')
url="https://github.com/ianlancetaylor/libbacktrace"
license=('BSD-3-Clause')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'libunwind')
provides=("libbacktrace=$pkgver" 'libbacktrace.so')
conflicts=('libbacktrace')
options=('staticlibs')
source=("git+https://github.com/ianlancetaylor/libbacktrace.git"
        "add_pkg-config_file.patch::https://patch-diff.githubusercontent.com/raw/ianlancetaylor/libbacktrace/pull/92.patch")
sha256sums=('SKIP'
            '680dbbf1db9953d4aeef2205274d2c3672d150a106f782c368d628623173dd1f')


prepare() {
  cd "libbacktrace"

  patch -Np1 -i "$srcdir/add_pkg-config_file.patch"
}

pkgver() {
  cd "libbacktrace"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libbacktrace"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-shared \
    --with-system-libunwind
  make
}

check() {
  cd "libbacktrace"

  #make check
}

package() {
  cd "libbacktrace"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libbacktrace"
}
