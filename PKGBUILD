# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-rtmpdump
pkgver=20140918
pkgrel=1
pkgdesc="Tool to download rtmp streams (mingw-w64)"
arch=('any')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=('!strip' '!buildflags' '!makeflags' 'staticlibs')
makedepends=('mingw-w64-gcc' 'git')
source=(git://git.ffmpeg.org/rtmpdump#commit=a1900c3)
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    cp -r ${srcdir}/rtmpdump ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    make CC=${_arch}-gcc LD=${_arch}-ld AR=${_arch}-ar SYS=mingw
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    make CC=${_arch}-gcc LD=${_arch}-ld AR=${_arch}-ar SYS=mingw prefix=/usr/${_arch} mandir=/usr/${_arch}/share/man DESTDIR="$pkgdir" install

    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a

    rm ${pkgdir}/usr/${_arch}/bin/*.exe
    rm -r ${pkgdir}/usr/${_arch}/{sbin,share}
  done
}
