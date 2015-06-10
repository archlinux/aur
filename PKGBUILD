# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libbluray
pkgver=0.8.0
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-libxml2' 'mingw-w64-freetype' 'mingw-w64-fontconfig')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config')
#makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'apache-ant')
#optdepends=('java-environment: for BD-J library')
source=(ftp://ftp.videolan.org/pub/videolan/libbluray/$pkgver/libbluray-$pkgver.tar.bz2
        'configure.patch')
md5sums=('bd2b8684d5afd17dc270f19eb1a5bb9a'
         '422ace4c396c294c851368f64d719755')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libbluray-${pkgver}

  patch -Np1 < ../configure.patch
  autoreconf
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${srcdir}/libbluray-$pkgver/configure --prefix=/usr/${_arch} \
      --host=${_arch} \
      --disable-examples \
      --disable-bdjava
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
