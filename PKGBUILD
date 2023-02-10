# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbacktrace-git
pkgver=r73.ad106d5
pkgrel=1
pkgdesc="Library to produce symbolic backtraces"
arch=('i686' 'x86_64')
url="https://github.com/ianlancetaylor/libbacktrace"
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'libunwind')
provides=("libbacktrace=$pkgver" 'libbacktrace.so')
conflicts=('libbacktrace')
options=('staticlibs')
source=("git+https://github.com/ianlancetaylor/libbacktrace.git"
        "0001-Provide-project-information-to-autotools.patch::https://github.com/ianlancetaylor/libbacktrace/commit/e4f3220e535a7bc93730e50d1f10c89ef3996075.patch"
        "0002-Add-pkg-config-file.patch::https://github.com/ianlancetaylor/libbacktrace/commit/f75f3eee369686694c379619a134c473982c0951.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "libbacktrace"

  patch -Np1 -i "$srcdir/0001-Provide-project-information-to-autotools.patch"
  patch -Np1 -i "$srcdir/0002-Add-pkg-config-file.patch" || true
}

pkgver() {
  cd "libbacktrace"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "libbacktrace"

  autoreconf -fi
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
