# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.38.4
pkgrel=5
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2")
sha256sums=('84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/pixman-${pkgver}/build-${_arch}"
    cd "${srcdir}/pixman-${pkgver}/build-${_arch}"
    ${_arch}-configure \
      --disable-gtk ..
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pixman-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
