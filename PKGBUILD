# Maintainer: naelstrof <naelstrof@gmail.com> 

# This PKGBUILD is on github: https://github.com/naelstrof/aur-pkgbuilds

pkgname=mingw-w64-libogg
pkgver=1.3.2
pkgrel=1
pkgdesc="Ogg bitstream and framing library (mingw-w64)"
arch=(any)
url="http://xiph.org"
license=('BSD')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils' 'mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz)
md5sums=('b72e1a1dbadff3248e4ed62a4177e937')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
      mkdir -p ${srcdir}/libogg-${pkgver}/${_arch}
      cd ${srcdir}/libogg-${pkgver}/${_arch}
      ${_arch}-configure
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd ${srcdir}/libogg-${pkgver}/${_arch}
      make DESTDIR="$pkgdir" install
      rm -r $pkgdir/usr/${_arch}/share/doc
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
