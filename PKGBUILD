# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: MArkus Kitsinger <root@swooshalicio.us>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_name="libfdk-aac"
pkgname="lib32-${_name}"
pkgver=3.0.0
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library (32-bit)"
arch=(
  'x86_64'
)
url="https://sourceforge.net/projects/opencore-amr/"
_url="https://github.com/mstorsjo/fdk-aac"
license=(
  'LicenseRef-Fraunhofer'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'git'
)
provides=(
  "${_name}.so"
  'libfdk-xhe-aac.so'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
)
b2sums=('a7171040e5e4ba76319698565473610b954a791cace26468e3293567cbbf61b9e75eb0a400d4f5da62062ce0afe00c58751808c7958f3f229031a3d3ce69679a')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --disable-example
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
