# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libmodplug
pkgver=0.8.9.0
pkgrel=1
pkgdesc="A MOD playing library (mingw-w64)"
arch=('any')
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=("http://downloads.sourceforge.net/modplug-xmms/libmodplug-${pkgver}.tar.gz")
sha1sums=('9d18572f85fdd95091befa972ee5d94139dcefde')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libmodplug-${pkgver}/build-${_arch} && cd ${srcdir}/libmodplug-${pkgver}/build-${_arch}

    ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libmodplug-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    install -D -m644 ${srcdir}/libmodplug-${pkgver}/COPYING ${pkgdir}/usr/${_arch}/share/licenses/libmodplug/LICENSE

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
# vim:set ts=2 sw=2 et:
