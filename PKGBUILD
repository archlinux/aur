# Maintainer: gurenya < valerik.hoh at gmail dot com >
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-graphite-fork
pkgver=1.3.14
pkgrel=2
pkgdesc="Reimplementation of the SIL Graphite text processing engine (mingw-w64)"
arch=('any')
url="https://github.com/silnrsi/graphite"
license=('LGPL-2.1-or-later OR MPL-2.0 OR GPL-2.0-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake'
             'python')
conflicts=("mingw-w64-graphite")
provides=("mingw-w64-graphite")
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/OtryvnoyKalendar/graphite-cmakefix/archive/refs/tags/v.${pkgver}.tar.gz"
        "002-graphite2-1.2.1-pkgconfig.patch"
        "003-graphite2-1.3.8-staticbuild.patch")
sha256sums=('f2593396fe785d8085d7d802f10791666e39a175ccd1d2cb2a8252c33d57b3ef'
            '22bef0d90c0266b3b0eff01859c1e002f84c165d12242c2bfc153f8f98fb272a'
            'c139e0bed6e45f333fbdc136a5013395fe22ca5381eac2294958bc85ea1b69fd')

prepare() {
  cd graphite-cmakefix-v.${pkgver}
  patch -p1 -i "${srcdir}"/002-graphite2-1.2.1-pkgconfig.patch
  patch -p1 -i "${srcdir}"/003-graphite2-1.3.8-staticbuild.patch
}

build() {
  cd graphite-cmakefix-v.${pkgver}
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
    cd "${srcdir}/graphite-cmakefix-v.${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
