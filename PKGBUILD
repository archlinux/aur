# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.43.4
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.xz")
sha512sums=('b40fb05bd58dc78f4e4e9b19c86991ab0611b708657c9a7fb42bfe82d57820a0fde01a34b00a0848a41da6c3fb90c2213942a70f435a0e9467631695d3bc7e36')

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
