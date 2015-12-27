pkgname=mingw-w64-lcms2
pkgver=2.7
pkgrel=1
pkgdesc="Small-footprint color management engine, version 2 (mingw-w64)"
arch=(any)
url="http://www.littlecms.com"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/sourceforge/lcms/lcms2-${pkgver}.tar.gz")
md5sums=('06c1626f625424a811fb4b5eb070839d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
  done
}
