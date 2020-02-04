# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_pkgname=doctrina
_prefix=mingw-w64
pkgname=${_prefix}-${_pkgname}
pkgver=0.1.12
pkgrel=3
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=("${_prefix}-gtk3" "${_prefix}-sqlite")
makedepends=("${_prefix}-meson" "vala")
options=('!buildflags' '!strip' 'staticlibs')
source=("https://gitlab.com/softwareperonista/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fec8fde4121a0f4582d0a328173e0fccd680f3fcf798baf9227d72be6fac255e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
