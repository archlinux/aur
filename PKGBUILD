# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.38.4
pkgrel=7
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2"
  "https://gitlab.freedesktop.org/pixman/pixman/commit/4851d4e20f66f540cd61fb69851df17671fc90d2.patch"
  "https://gitlab.freedesktop.org/pixman/pixman/commit/be0d3e699401f8230fa88c28c52d73c57f13f327.patch"
  "https://gitlab.freedesktop.org/pixman/pixman/commit/fd5c0da57985a430912907d4a898ed1ddb854ead.patch"
  "https://gitlab.freedesktop.org/pixman/pixman/merge_requests/13.diff")
sha256sums=('84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550'
  '48374ee1ec7a95b4262e6a26d3f5596c17f01a28225ce4927ee9ad90e0205e88'
  '55977e70dc9013dabb2256def5c622ac3c8607a96d829f8c025a8a73b241b4e2'
  '8d7cf32ff224dae5f52fad337c38be3591fad4383679bbfe946685bf8bcec3ad'
  '0d7c3b9da2e8f6973aaeae9aedae91e51f383cfd58ca5b6b0d3bcc6162fd3cbd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/pixman-${pkgver} 
  patch -Np1 -i ../4851d4e20f66f540cd61fb69851df17671fc90d2.patch
  patch -Np1 -i ../be0d3e699401f8230fa88c28c52d73c57f13f327.patch
  patch -Np1 -i ../fd5c0da57985a430912907d4a898ed1ddb854ead.patch
  patch -Np1 -i ../13.diff
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
