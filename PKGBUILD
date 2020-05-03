# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-graphite
pkgver=1.3.14
pkgrel=1
pkgdesc="Reimplementation of the SIL Graphite text processing engine (mingw-w64)"
arch=('any')
url="https://github.com/silnrsi/graphite"
license=('LGPL' 'GPL' 'custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake'
             'python2')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz"
        "002-graphite2-1.2.1-pkgconfig.patch"
        "003-graphite2-1.3.8-staticbuild.patch")
sha256sums=('f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d'
            '22bef0d90c0266b3b0eff01859c1e002f84c165d12242c2bfc153f8f98fb272a'
            'c139e0bed6e45f333fbdc136a5013395fe22ca5381eac2294958bc85ea1b69fd')

prepare() {
  cd graphite2-${pkgver}
  patch -p1 -i "${srcdir}"/002-graphite2-1.2.1-pkgconfig.patch
  patch -p1 -i "${srcdir}"/003-graphite2-1.3.8-staticbuild.patch
}

build() {
  cd graphite2-${pkgver}
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DGRAPHITE2_COMPARE_RENDERER=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}2-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
