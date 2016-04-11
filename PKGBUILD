
pkgname=mingw-w64-cgal
pkgver=4.8
pkgrel=1
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-boost' 'mingw-w64-zlib' 'mingw-w64-qt5-svg')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL', 'LGPL')
url="http://www.cgal.org"
source=("https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-4.8/CGAL-$pkgver.tar.xz")
md5sums=('e31e7039b5cdc74ac7b106db8ba644f3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd "$srcdir/CGAL-${pkgver}"
}

build()
{
  cd "$srcdir/CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DWITH_CGAL_Qt5=OFF \
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
