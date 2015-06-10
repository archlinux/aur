# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libmodplug
pkgver=0.8.8.5
pkgrel=2
pkgdesc="A MOD playing library (mingw-w64)"
arch=('any')
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc')
source=("http://downloads.sourceforge.net/modplug-xmms/libmodplug-${pkgver}.tar.gz")
sha1sums=('771ee75bb8bfcfe95eae434ed1f3b2c5b63b2cb3')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${srcdir}/libmodplug-${pkgver}/configure --prefix=/usr/${_arch} --host=${_arch} \
      --enable-static
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    install -D -m644 ${srcdir}/libmodplug-${pkgver}/COPYING ${pkgdir}/usr/${_arch}/share/licenses/libmodplug/LICENSE

  	${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
  	${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
