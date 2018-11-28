# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_pkgname=doctrina
_prefix=mingw-w64
pkgname=${_prefix}-${_pkgname}
pkgver=0.1.8
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=("${_prefix}-glib2" "${_prefix}-sqlite")
makedepends=("${_prefix}-meson" "vala")
source=("https://git.softwareperonista.com.ar/cdp/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c2a5424f7e45c53c4580f86c4033fad3e703d058e231791a8645c21bfa044b27')
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
