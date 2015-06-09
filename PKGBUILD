pkgname=mingw-w64-opus
pkgver=1.1
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (mingw-w64)"
arch=(any)
url="http://www.opus-codec.org"
license=("BSD")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://downloads.us.xiph.org/releases/opus/opus-$pkgver.tar.gz")
md5sums=('c5a8cf7c0b066759542bc4ca46817ac6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-custom-modes \
      --disable-doc \
      --disable-extra-programs
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
