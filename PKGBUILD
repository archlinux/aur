# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-lame
pkgver=3.99.5
pkgrel=4
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (mingw-w64)"
arch=('any')
url="http://lame.sourceforge.net/"
#depends=('ncurses')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'nasm')
license=('LGPL')
source=("http://downloads.sourceforge.net/lame/lame-$pkgver.tar.gz")
md5sums=('84835b313d4a8b68f5349816d33e07ce')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    
    CFLAGS="-msse" CPPFLAGS="-msse" $srcdir/lame-$pkgver/configure --prefix=/usr/${_arch} \
                --host=${_arch} \
                --enable-nasm \
                --enable-shared
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r $pkgdir/usr/${_arch}/share
    rm -r $pkgdir/usr/${_arch}/bin/*.exe
  done
}

# vim:set ts=2 sw=2 et:
