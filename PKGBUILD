# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-graphite
pkgver=1.3.15
pkgrel=1
pkgdesc="Reimplementation of the SIL Graphite text processing engine (mingw-w64)"
arch=('any')
url="https://github.com/silnrsi/graphite"
license=('LGPL-2.1-or-later OR MPL-2.0 OR GPL-2.0-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake'
             'python')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz"
        "001-gcc15.patch"
        "002-graphite2-1.2.1-pkgconfig.patch"
        "003-graphite2-1.3.8-staticbuild.patch")
sha256sums=('c6bc8b4252724665297f7cad0c55897285c673f9b8e6db3522ace833593fe0b1'
            '2296d1c189cfb129403f83e7a704a333147856b37475320965c463386ef9d8ef'
            '577effbc409a49f72f38e95fbea340e5ca2d0f324f51170697081c862d4011ec'
            'c139e0bed6e45f333fbdc136a5013395fe22ca5381eac2294958bc85ea1b69fd')

prepare() {
  cd graphite2-${pkgver}
  patch -p1 -i "${srcdir}"/001-gcc15.patch
  patch -p1 -i "${srcdir}"/002-graphite2-1.2.1-pkgconfig.patch
  patch -p1 -i "${srcdir}"/003-graphite2-1.3.8-staticbuild.patch
}

build() {
  cd graphite2-${pkgver}
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
