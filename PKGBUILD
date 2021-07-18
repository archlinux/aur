pkgname=mingw-w64-qwt-qt6
pkgver=6.2.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt6-svg')
makedepends=('mingw-w64-gcc' 'qt6-base')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2" qt6.patch)
sha256sums=('9194f6513955d0fd7300f67158175064460197abab1a92fa127a67a4b0b71530' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qwt-${pkgver}
  patch -p1 -i "${srcdir}"/qt6.patch
}

build() {
  cd qwt-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DUSE_QT6=ON ..
    make
    popd
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
