# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_pkgname=doctrina
_prefix=mingw-w64
pkgname=${_prefix}-${_pkgname}
pkgver=0.1.6
pkgrel=2
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=("${_prefix}-glib2" "${_prefix}-sqlite")
makedepends=("${_prefix}-meson" "vala")
source=("https://git.softwareperonista.com.ar/cdp/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11c180ff683e183ba6779fde3e287711f47b5fa942080f3e34460a6721138151')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
