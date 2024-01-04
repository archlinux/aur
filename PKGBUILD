pkgname=mingw-w64-cgal
pkgver=5.6
pkgrel=1
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-boost' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL', 'LGPL')
url="http://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/v${pkgver}/CGAL-${pkgver}.tar.xz)
sha256sums=('dcab9b08a50a06a7cc2cc69a8a12200f8d8f391b9b8013ae476965c10b45161f')

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
  done
}
