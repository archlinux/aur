# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libfreexl
pkgver=2.0.0
pkgrel=1
pkgdesc="Library to extract valid data from within an Excel (.xls) spreadsheet (mingw-w64)"
arch=('any')
url="https://www.gaia-gis.it/fossil/freexl/"
license=('MPL' 'GPL' 'LGPL')
depends=('mingw-w64-crt' 'mingw-w64-libiconv' 'mingw-w64-minizip' 'mingw-w64-expat')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.gaia-gis.it/gaia-sins/freexl-${pkgver}.tar.gz"
        "01-fix-pkgconfig.patch")
sha256sums=('176705f1de58ab7c1eebbf5c6de46ab76fcd8b856508dbd28f5648f7c6e1a7f0'
            'bc6facd7b0bde308d442962b350fa1894cd6605412ae4665775be745069e4ea5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/freexl-${pkgver}
  patch -Np1 -i ${srcdir}/01-fix-pkgconfig.patch
}

build() {
  cd ${srcdir}/freexl-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freexl-$pkgver/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/usr/${_arch}/share/man"
    chmod a-x "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
