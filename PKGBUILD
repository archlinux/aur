# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: MArkus Kitsinger <root@swooshalicio.us>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_name="libfdk-aac"
pkgname="lib32-${_name}"
pkgver=2.0.3
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library (32-bit)"
arch=('x86_64')
url="https://sourceforge.net/projects/opencore-amr/"
_url="https://github.com/mstorsjo/fdk-aac"
license=('custom')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('git' 'lib32-gcc-libs')
provides=("${_name}.so")
_pkgsrc="fdk-aac"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('c0256c9bb0b94451bf0a1a6699defc1fb51ea8a3c77f8dcb81bdcbb3d375bdb3a7a4eeb6965af3237e191a1ad78121198299d2974ac9f6ef7c76a2e0daf3d5cb')

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
