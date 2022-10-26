# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.42.0
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.xz")
sha512sums=('43d43d1aef9b8a6167098ab68ce2cfd8c0429c4825d40a4fb468b5b51dc1a2035f8bd1b70413e4ecd77deb469b5d558f42171b423e348d5ddd8604c466ffc7d9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/pixman-${pkgver}/build-${_arch}"
    cd "${srcdir}/pixman-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      -D loongson-mmi=disabled \
      -D vmx=disabled \
      -D arm-simd=disabled \
      -D neon=disabled \
      -D iwmmxt=disabled \
      -D mips-dspr2=disabled \
      -D b_lto=false \
      -D gtk=disabled \
      -D strip=false \
      --default-library both ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    # fix static libs inside pc file
    sed -i "s/-lpixman-mmx -lpixman-sse2 -lpixman-ssse3//g" ${srcdir}/pixman-${pkgver}/build-${_arch}/meson-private/pixman-1.pc
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/pixman-${pkgver}/build-${_arch}" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
