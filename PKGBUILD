
pkgname=mingw-w64-cgal
pkgver=4.10
pkgrel=3
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-boost' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'wine')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL', 'LGPL')
url="http://www.cgal.org"
source=("https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-${pkgver}/CGAL-${pkgver}.tar.xz")
sha1sums=('b399c21862628d6f9179cf44fa1f23590d28774a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd "$srcdir/CGAL-${pkgver}"
  # https://github.com/CGAL/cgal/pull/2306
  sed -i "s|target_link_libraries( CGAL_Core CGAL \${CGAL_3RD_PARTY_LIBRARIES} )|target_link_libraries( CGAL_Core CGAL \${CGAL_3RD_PARTY_LIBRARIES} \${CGAL_Core_3RD_PARTY_LIBRARIES})|g" src/CGAL_Core/CMakeLists.txt
  sed -i "s|target_link_libraries( CGAL_Core INTERFACE ${CGAL_3RD_PARTY_LIBRARIES} )|target_link_libraries( CGAL_Core INTERFACE ${CGAL_3RD_PARTY_LIBRARIES} \${CGAL_Core_3RD_PARTY_LIBRARIES})|g" src/CGAL_Core/CMakeLists.txt
}

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
