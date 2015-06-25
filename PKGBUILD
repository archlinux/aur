# Maintainer: Daniel Micay <danielmicay@gmail.com>
pkgname=mingw-w64-portaudio
pkgver=19_20140130
pkgrel=2
pkgdesc="A free, cross-platform, open source, audio I/O library. (mingw-w64)"
arch=(any)
url="http://www.portaudio.com"
license=("custom")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags !makeflags staticlibs)
source=("http://www.portaudio.com/archives/pa_stable_v$pkgver.tgz"
        fix_static_linking.patch)
md5sums=('7f220406902af9dca009668e198cbd23'
         'b1cf5d6c8283c9b59956188a4f165172')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  patch -p0 -i fix_static_linking.patch
  cd portaudio
  autoconf
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --target=${_arch} \
      --enable-static \
      --enable-cxx
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
