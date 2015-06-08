pkgname=mingw-w64-libjpeg
pkgver=9
pkgrel=1
pkgdesc="JPEG image compression (mingw-w64)"
arch=(any)
url="http://www.infai.org/jpeg"
license=("custom")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
conflicts=(mingw-w64-libjpeg-turbo)
provides=(mingw-w64-libjpeg-turbo)
source=("http://www.ijg.org/files/jpegsrc.v$pkgver.tar.gz")
md5sums=('b397211ddfd506b92cd5e02a22ac924d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-lib}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --target=${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m644 "$srcdir/jpeg-$pkgver/jpegint.h" "$pkgdir/usr/${_arch}/include/"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}