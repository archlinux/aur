# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=mingw-w64-libvorbis
pkgver=1.3.4
pkgrel=3
pkgdesc="Vorbis codec library (mingw-w64)"
arch=(any)
url="http://xiph.org"
license=('custom')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs)
source=(http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz)
md5sums=('8851c593a52d1ef9c526d95174873852')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  #-march=i686 optimizes too much, strip it out
  for _arch in ${_architectures}; do
      mkdir -p "${srcdir}/libvorbis-${pkgver}-build-${_arch}"
      cd "${srcdir}/libvorbis-${pkgver}-build-${_arch}"
      CFLAGS=${CFLAGS/-march=$CARCH} "${srcdir}"/libvorbis-${pkgver}/configure --enable-static --enable-shared --prefix=/usr/${_arch} --host=${_arch}
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd "${srcdir}"/libvorbis-${pkgver}-build-${_arch}
      make DESTDIR="$pkgdir" install
      rm -r "$pkgdir"/usr/${_arch}/share/doc
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
