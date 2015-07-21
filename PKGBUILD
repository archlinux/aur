# Maintainer: naelstrof <naelstrof@gmail.com>

# This PKGBUILD is on github: https://github.com/naelstrof/aur-pkgbuilds

pkgname=mingw-w64-libsndfile
pkgver=1.0.25
pkgrel=3
pkgdesc="A C library for reading and writing files containing sampled sound (mingw-w64)"
arch=(any)
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-flac' 'mingw-w64-libvorbis' 'mingw-w64-crt' 'mingw-w64-configure')
options=('staticlibs' '!strip')
source=(http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz)
md5sums=('e2b7bb637e01022c7d20f95f9c3990a2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS CFLAGS CXXFLAGS
  for _arch in ${_architectures}; do
      mkdir -p ${srcdir}/libsndfile-${pkgver}/${_arch}
      cd ${srcdir}/libsndfile-${pkgver}/${_arch}
      LIBS="`${_arch}-pkg-config --libs vorbis ogg`" ${_arch}-configure
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd ${srcdir}/libsndfile-${pkgver}/${_arch}
      make DESTDIR="${pkgdir}" install
      rm -r $pkgdir/usr/${_arch}/share/doc/
      rm -r $pkgdir/usr/${_arch}/share/man/
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
