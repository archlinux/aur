# Maintainer: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-quazip-qt4
pkgver=0.7
pkgrel=1
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package (mingw-w64)"
url="http://sourceforge.net/projects/quazip/"
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-qt4')
makedepends=('mingw-w64-gcc')
conflicts=('mingw-w64-quazip-qt5')
source=("http://downloads.sourceforge.net/project/quazip/quazip/$pkgver/quazip-$pkgver.tar.gz")
options=('!strip' '!buildflags' 'staticlibs')
license=('LGPL')
md5sums=('52a9d807934ce4e9c30ead677a3148d2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  
  for _arch in ${_architectures}; do
    for opt in static dll; do
      mkdir "${srcdir}/${_arch}-${opt}"
      cd "${srcdir}/${_arch}-${opt}"
      ${_arch}-qmake ../quazip-$pkgver/quazip/quazip.pro \
        PREFIX="${pkgdir}/usr/${_arch}" \
        CONFIG+=${opt} \
        LIBS+=-lz
      make
    done
  done
}

package() {
  for _arch in ${_architectures}; do
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}
    cd "${srcdir}/${_arch}-dll"
    make install
    mv "${pkgdir}/usr/${_arch}/lib/libquazip.a" "${pkgdir}/usr/${_arch}/lib/libquazip.dll.a"
    cd "${srcdir}/${_arch}-static"
    make install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    mv "${pkgdir}/usr/${_arch}/lib/"*.dll "${pkgdir}/usr/${_arch}/bin/"
  done
}
