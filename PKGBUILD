# Maintainer: osfans <waxaca@163.com>
_pkgname=uchardet
pkgname=mingw-w64-${_pkgname}
pkgver=0.0.6
pkgrel=1
pkgdesc="Encoding detector library ported from Mozilla (mingw-w64)"
arch=(any)
url='https://www.freedesktop.org/wiki/Software/uchardet'
license=('MPL')
makedepends=('mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
source=("https://www.freedesktop.org/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('eceeadae060bf277e298d709856609dde32921271140dc1fb0a33c7b6e1381033fc2960d616ebbd82c92815936864d2c0743b1b5ea1b7d4a200df87df80d6de5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  #unset LDFLAGS
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -Bbuild-${_arch} -H.
    make -Cbuild-${_arch}
  done
}

package() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    make -Cbuild-${_arch} DESTDIR="$pkgdir" install
    ln -s libuchardet.dll $pkgdir/usr/${_arch}/bin/uchardet.dll
  done
}
