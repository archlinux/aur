# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=mingw-w64-opusfile
pkgver=0.10
pkgrel=2
pkgdesc="The opusfile library provides seeking, decode, and playback of Opus streams in the Ogg container."
arch=(any)
url="http://www.opus-codec.org"
license=("BSD")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-opus mingw-w64-libogg)
options=(staticlibs !strip !buildflags)
source=("http://downloads.xiph.org/releases/opus/opusfile-${pkgver}.tar.gz")
sha384sums=('b491ecdf250b00298e0dc2b9d2e93d4f4d3bb0efc237902267f2b5db3bbc6c70ba12cb1af3d93cec7853a7b83b90388e')

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
      --disable-doc \
      --disable-http
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
