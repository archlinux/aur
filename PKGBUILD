pkgname=mingw-w64-libmixmod
pkgver=2.1.12
pkgrel=1
pkgdesc="Classification with Mixture Modelling (mingw-w64)"
arch=('any')
url="https://github.com/mixmod"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dd6c0d1fef7f2aa80e0c77680baa0718aa6326302bfd11b7e5dd99a378e5b277')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "$srcdir"/mixmod-${pkgver}
}

build () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DCMAKE_UNITY_BUILD=ON .
    cmake --build build-${_arch}
  done
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
    rm -r "$pkgdir"/usr/${_arch}/share 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

