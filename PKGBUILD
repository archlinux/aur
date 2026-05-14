pkgname=mingw-w64-libcuba
pkgver=4.2.2
pkgrel=1
pkgdesc='A library for multidimensional numerical integration (mingw-w64)'
arch=('any')
url="https://feynarts.de/cuba/"
license=(LGPL-3.0-or-later)
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs' '!debug')
source=(Cuba-$pkgver::git+https://github.com/jschueller/cuba.git)
sha256sums=(SKIP)

_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "$srcdir/Cuba-$pkgver"
}

build() {
  cd "$srcdir/Cuba-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/Cuba-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
