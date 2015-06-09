pkgname=mingw-w64-speex
pkgver=1.2rc1
pkgrel=7
pkgdesc="A free codec for free speech (mingw-w64)"
arch=(any)
url="http://www.speex.org"
license=("BSD")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-libogg)
options=(staticlibs !strip !buildflags)
source=("http://downloads.us.xiph.org/releases/speex/speex-$pkgver.tar.gz")
md5sums=('c4438b22c08e5811ff10e2b06ee9b9ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/speex-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    sed -i "s/deplibs_check_method=.*/deplibs_check_method=pass_all/g" libtool
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
