# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=mingw-w64-lame
pkgver=4.0
pkgrel=1
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (mingw-w64)"
arch=('any')
url="http://lame.sourceforge.net/"
depends=(
  mingw-w64-crt
  mingw-w64-mpg123
  mingw-w64-ncurses
)
options=('!strip' '!buildflags' '!libtool' 'staticlibs' '!debug')
makedepends=(
  mingw-w64-gcc
  mingw-w64-configure
  mingw-w64-wine
  nasm
  subversion)
license=(LGPL-2.0-only)
_revision=6531
source=(
  https://sourceforge.net/projects/lame/files/lame/${pkgver}/lame-${pkgver}.tar.gz
  lame-symbols.patch
  lame-cbr-abr-quality-settings-clamp.patch
  mingw.patch
  wine.patch
  winsock2.patch
)
b2sums=('9e05275c28bc6d086011362f211edc2e2cd831429ca4d2daa1bc0ae7084ebd9bec3c3db93e1cab638570a9f624468372b9ff39f3dc9e7d0b105dbba7f248b2df'
        'c8cc00f560515231dba1bf9393d056ecb11c2268bafae4923e8c2594b92de473b94e6e5cbef1e52b4843ddd36bb4e06ea6b24ac4a18aa682b2ab7c5ef6deb73c'
        '217cf6611f13cb91997856c3af9c30b7c23fa3744126d27f71768001b6799a4a100c9c0baec34beb656fee1c8c519c86b1a9c549e2ea6befe197eb930f70caaa'
        'b96dda3836a85106cbe297ea896e9b86741f358764d34149c4f3901477f55bffe4e06a32753b9a183081c3d015ba321a4562572c0a2266e0a9b0b731a9980487'
        'aadab9300aa62e35f447464d0e06326f26909375c3ada27ad42c042f62078319c469b59f321e4ef25062de1280012cebba58c683b81ba852a7a8f0136c370ed3'
        '4203d30007f128eed744b1119b9932fab65d8a01c70de900a469a044e9c05dc7e7b1c2ef99f5e9b4b32e07aede20dfea23aecf6a60a94d0a1360cd9e3de98806')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/lame-${pkgver}

  patch -Np1 -i "${srcdir}/lame-symbols.patch"
  patch -Np1 -i "${srcdir}/lame-cbr-abr-quality-settings-clamp.patch"
  patch -Np1 -i "${srcdir}/mingw.patch"
  patch -Np1 -i "${srcdir}/wine.patch"
  patch -Np1 -i "${srcdir}/winsock2.patch"

  autoreconf -fiv -I /usr/share/gettext/m4
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/lame-${pkgver}/build-${_arch} && cd ${srcdir}/lame-${pkgver}/build-${_arch}

    unset LDFLAGS CPPFLAGS

    export LIBS="-lncursesw"
    export CFLAGS="-msse"
    export CFLAGS+=" -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"
    export CPPFLAGS="-msse"

    ${_arch}-configure \
                --enable-nasm \
                --enable-mp3rtp \
                --enable-shared
    make
  done
}

check() {
  for _arch in ${_architectures}; do
      WINE=${_arch}-wine make test -C ${srcdir}/lame-${pkgver}/build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/lame-${pkgver}/build-${_arch}

    make DESTDIR="$pkgdir" install

    ${_arch}-strip -s $pkgdir/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r $pkgdir/usr/${_arch}/share

    chmod 644 ${pkgdir}/usr/${_arch}/lib/*.dll.a
  done
}

# vim:set ts=2 sw=2 et:
