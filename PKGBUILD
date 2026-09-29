pkgname=mingw-w64-bliss
pkgver=0.77
pkgrel=1
pkgdesc="A library for computing automorphism groups and canonical forms of graphs (mingw-w64)"
arch=('any')
url='https://users.aalto.fi/~tjunttil/bliss/'
license=(GPL-3.0-only)
depends=('mingw-w64-crt' )
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/scipopt/bliss/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9af3d614d1a6e9649f055444d21d4e9d22fca0b69f072f10ea8f3e23d8479efd')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "${srcdir}/bliss-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/bliss-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

