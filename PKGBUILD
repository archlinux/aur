# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-rtmpdump
pkgver=2.4.r96.fa8646d
pkgrel=3
pkgdesc="Tool to download rtmp streams (mingw-w64)"
arch=('any')
url="https://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-gnutls')
options=('!strip' '!buildflags' '!makeflags' 'staticlibs')
makedepends=('mingw-w64-gcc' 'git')
_commit='fa8646d'
source=("git+https://git.ffmpeg.org/rtmpdump#commit=${_commit}")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd rtmpdump

  _ver_name='2.4'
  _ver_commit='c28f1bab7822de97353849e7787b59e50bbb1428'

  echo "${_ver_name}.r$(git rev-list --count ${_ver_commit}..HEAD).${_commit}"
}

build() {
  for _arch in ${_architectures}; do
    cp -r ${srcdir}/rtmpdump ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile

    unset LDFLAGS CPPFLAGS
    make \
      CC=${_arch}-gcc \
      LD=${_arch}-ld \
      AR=${_arch}-ar \
      SYS=mingw
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    make \
      CC=${_arch}-gcc \
      LD=${_arch}-ld \
      AR=${_arch}-ar \
      SYS=mingw \
      prefix=/usr/${_arch} \
      sbindir=/usr/${_arch}/bin \
      mandir=/usr/${_arch}/share/man \
      DESTDIR="$pkgdir" \
      install

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a

    rm -r ${pkgdir}/usr/${_arch}/share
  done
}
# vim: ts=2 sw=2 et:
