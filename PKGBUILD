# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alberto Oporto Ames <otreblain@gmail.com>

_name="libinih"
pkgname="lib32-${_name}"
pkgver=58
pkgrel=1
pkgdesc='A simple .INI file parser written in C (32-bit)'
arch=('x86_64')
url="https://github.com/benhoyt/inih"
license=('BSD-3-Clause')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}>=${pkgver}")
makedepends=('meson')
provides=("${_name}.so" 'libINIReader.so')
_pkgsrc="inih-r${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/r${pkgver}.tar.gz")
b2sums=('ba71b21b30c039df026adbd29b422b064934046ced21a37479421e866b73969826dc1fea4e3bc0c5ea427248c774d8f80b83056c54769d454bafa2f336d08024')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" \
    --cross-file lib32 \
    -Ddefault_library=shared \
    -Ddistro_install=true \
    -Dwith_INIReader=true
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}

# vim: ts=2 sw=2 et:
