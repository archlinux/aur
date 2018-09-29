
pkgname=mingw-w64-cgal
pkgver=4.12.1
pkgrel=1
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-boost' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-wine')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL', 'LGPL')
url="http://www.cgal.org"
source=("https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-${pkgver}/CGAL-${pkgver}.tar.xz")
sha256sums=('8c4a65875a8aaad2e93001aba7ae1c6ccaba4f8fe03be3ad6195f773d6b3eaba')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "$srcdir/CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ..
    make
    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/CGAL-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/cgal_*
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
