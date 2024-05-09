pkgname=mingw-w64-qwt-qt6
pkgver=6.3.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="https://qwt.sourceforge.io/"
depends=('mingw-w64-qt6-svg')
makedepends=('mingw-w64-gcc' 'qt6-base')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2" qt6.patch)
sha256sums=('dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qwt-${pkgver}
  patch -p1 -i "${srcdir}"/qt6.patch
}

build() {
  cd qwt-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DUSE_QT6=ON .
    make -C build-${_arch}
  done
}

package() {
  for _target in ${_architectures}; do
    cd "${srcdir}/qwt-${pkgver}/build-${_target}"
    make install DESTDIR="${pkgdir}" 
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
    ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
  done
}
