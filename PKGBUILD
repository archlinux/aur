# Maintainer: edscott@imp.mx
# Contributor: 

pkgname=mingw-w64-dbh
pkgver=5.0.22
pkgrel=1
pkgdesc="GNU DBH database library (mingw-w64)"
url="http://www.gnu.org/software/libdbh/"
license=('GPL')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-gettext')
source=("http://downloads.sourceforge.net/project/dbh/dbh/${pkgver}/libdbh2-${pkgver}.tar.gz"
        0001-remove-lrt.patch)
options=('staticlibs' '!buildflags' '!strip')
md5sums=('f8c592f6fd4d336cbb5529dc52177e4f'
         'e24ed905636b1f053896433f73d5922e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libdbh2-${pkgver}"
  patch -Np1 -i ${srcdir}/0001-remove-lrt.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/libdbh2-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libdbh2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
