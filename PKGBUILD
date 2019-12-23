# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-pixman
pkgver=0.38.4
pkgrel=8
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-meson mingw-w64-libpng)
depends=(mingw-w64-gcc)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2"
  "4851d4e20f66f540cd61fb69851df17671fc90d2.patch"
  "be0d3e699401f8230fa88c28c52d73c57f13f327.patch"
  "fd5c0da57985a430912907d4a898ed1ddb854ead.patch"
  "afc6c935f1b52ca74d96f1ea2cbfb3e47ffb7fd4.patch")
sha256sums=('84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550'
  '8b4cdf460a1a3298aeb156c75b304c19d52421ad064f64866f002355bed94a06'
  '3103cb4c482d150acdc08f901a1383bd5a6e044653dc3afc5b73919f73f529d1'
  '2efc53fe4f0831441921884b4fb2896fbd14b865892c9cd5df4dfcd260c9bb41'
  '8a708e65b528e73898c6b9690a1920d25fc3106928c28959694af3a5edad999b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/pixman-${pkgver} 
  # https://gitlab.freedesktop.org/pixman/pixman/commit/4851d4e20f66f540cd61fb69851df17671fc90d2.patch
  patch -Np1 -i ../4851d4e20f66f540cd61fb69851df17671fc90d2.patch
  # https://gitlab.freedesktop.org/pixman/pixman/commit/be0d3e699401f8230fa88c28c52d73c57f13f327.patch
  patch -Np1 -i ../be0d3e699401f8230fa88c28c52d73c57f13f327.patch
  # https://gitlab.freedesktop.org/pixman/pixman/commit/fd5c0da57985a430912907d4a898ed1ddb854ead.patch
  patch -Np1 -i ../fd5c0da57985a430912907d4a898ed1ddb854ead.patch
  # https://gitlab.freedesktop.org/pixman/pixman/commit/afc6c935f1b52ca74d96f1ea2cbfb3e47ffb7fd4.patch
  patch -Np1 -i ../afc6c935f1b52ca74d96f1ea2cbfb3e47ffb7fd4.patch
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
