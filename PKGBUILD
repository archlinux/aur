# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="liblrdf"
pkgname="lib32-${_name}"
pkgver=0.6.1
pkgrel=4
pkgdesc="A library for the manipulation of RDF file in LADSPA plugins (32-bit)"
arch=('x86_64')
url="https://github.com/swh/LRDF"
license=(
  'LGPL-2.1-or-later'
  # 'GPL-2.0-only'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
  'lib32-raptor>=2.0.0'
)
makedepends=(
  'lib32-gcc-libs'

  'ladspa'
)
provides=(
  "${_name}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha512sums=('7732813eec704aef984d056de254e4fa049fdd0a7444b6a88f75f012afe9c587cbd1295f027c77361fa42bc097cdce9d9cabdba6b86e99a3c14805d84258df1c')

build() {
  export CFLAGS+=" -m32"
  # raptor.h changed location
  export CXXFLAGS+=" -m32 $(pkg-config --cflags raptor2)"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --sbindir='/usr/bin'
    --sysconfdir='/etc'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
