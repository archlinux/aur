pkgname=mingw-w64-cgal
pkgver=6.1.1
pkgrel=1
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-gmp' 'mingw-w64-boost' 'mingw-w64-zlib' 'mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=(GPL-3.0-or-later LGPL-3.0-or-later)
url="https://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/v${pkgver}/CGAL-${pkgver}.tar.xz)
sha256sums=('52506935f70e247ed2777e3c65f20e86f79208c2a2d0e180ae7475daf11c96ef')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build()
{
  cd "$srcdir/CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package()
{
  cd "$srcdir/CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm "$pkgdir"/usr/${_arch}/bin/cgal_*
    rm -r "$pkgdir"/usr/${_arch}/share
  done
}
