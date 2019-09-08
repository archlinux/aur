# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.38.4
pkgrel=4
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2"
  "https://gitlab.freedesktop.org/creiter/pixman/commit/303c80d69eb72a78d0bb7908d2038cbc3493f3af.patch")
sha256sums=('84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550'
  'd950e6600fc504a7d134829df639439031a07c3da39ff4eaaea2243f299927bc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/pixman-${pkgver} 
  patch -Np1 -i ../303c80d69eb72a78d0bb7908d2038cbc3493f3af.patch
}

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
