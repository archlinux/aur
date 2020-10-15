# Maintainer: Alexander Nicholi <me@nicholatian.com>

pkgname=mingw-w64-gbafix
pkgver=1.2.0
pkgrel=1
pkgdesc='Fix GBA ROM file headers.'
arch=(any)
url='https://github.com/devkitPro/gba-tools'
license=('GPL-2.0')
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!libtool !buildflags)
provides=("$pkgname")
conflicts=("$pkgname")
source=('https://github.com/devkitPro/gba-tools/releases/download/v1.2.0/gba-tools-1.2.0.tar.bz2')
sha1sums=('aad9a673b4578ad8617a5e8397266ee9028a0d42')

#_realname=gbafix
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/gba-tools-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make -j$(($(nproc) * 2))
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.py' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
