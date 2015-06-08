pkgname=mingw-w64-libtheora
pkgver=1.1.1
pkgrel=7
pkgdesc="An open video codec developed by the Xiph.org (mingw-w64)"
arch=('any')
url="http://xiph.org"
license=("BSD")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libvorbis')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2"
        libtheora-1.1.1-fix-pp_sharp_mod-calc.patch
        libtheora-1.1.1-libpng16.patch
        libtheora-1.1.1-libm.patch
        libtheora-1.1.1-libadd.patch
        mingw-libtheora-1.1.1-rint.patch)
md5sums=('292ab65cedd5021d6b7ddd117e07cd8e'
         '0ed7f7af622c2d675a9809980d8aad71'
         '08edd81c7a1be2c4edfd2cd3c112a8c6'
         'f5f96fedc1a7a23e0530298b045c7101'
         '4357cded33bc3397b4123790e4967d24'
         '54c626ca201f51ebd9d97595f57a25b4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libtheora-$pkgver"

  # fedora patches
  patch -p1 -i "${srcdir}"/libtheora-1.1.1-fix-pp_sharp_mod-calc.patch
  patch -p0 -i "${srcdir}"/libtheora-1.1.1-libpng16.patch
  patch -p1 -i "${srcdir}"/libtheora-1.1.1-libm.patch
  patch -p1 -i "${srcdir}"/libtheora-1.1.1-libadd.patch
  patch -p1 -i "${srcdir}"/mingw-libtheora-1.1.1-rint.patch

  # no custom CFLAGS please
  sed -i 's/CFLAGS="$CFLAGS $cflags_save"/CFLAGS="$cflags_save"/g' configure.ac

  # fix syntax of export symbols files
  sed -i 's/^EXPORTS//' win32/xmingw32/*.def

  autoreconf -fi -I m4
}

build() {
  cd "${srcdir}/libtheora-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtheora-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  cd "${srcdir}/libtheora-$pkgver"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
