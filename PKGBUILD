# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-orc
pkgver=0.4.23
pkgrel=2
pkgdesc="The Oild Runtime Compiler (mingw-w64)"
arch=('any')
license=('custom')
url="http://code.entropywave.com/projects/orc/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
source=(http://gstreamer.freedesktop.org/data/src/orc/orc-${pkgver}.tar.xz)
md5sums=('72e0612ace54d77aa2f7a006348ee81a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build () {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/orc-$pkgver/build-${_arch} && cd ${srcdir}/orc-$pkgver/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${_arch}-configure --enable-gtk-doc-html=no
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/orc-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir" install
    install -Dm644 ${srcdir}/orc-$pkgver/COPYING "$pkgdir/usr/${_arch}/share/licenses/orc/COPYING"

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm ${pkgdir}/usr/${_arch}/bin/*.exe
  done
}
