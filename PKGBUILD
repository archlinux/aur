# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: edscott@imp.mx

pkgname=mingw-w64-dbh
pkgver=5.0.22
pkgrel=2
pkgdesc="GNU DBH database library (mingw-w64)"
url="http://www.gnu.org/software/libdbh/"
license=('GPL')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-gettext')
source=("http://downloads.sourceforge.net/project/dbh/dbh/${pkgver}/libdbh2-${pkgver}.tar.gz"
        "0001-remove-lrt.patch")
options=('staticlibs' '!buildflags' '!strip')
sha256sums=('8df54e7d1c1d071e385b59256b42a9538cb1b744b11ecc022e188d99046e91d7'
            '23a6319cd6b315e184267e01e7fa9355e37d929057b4823a95b26cd36a8b2efe')

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
