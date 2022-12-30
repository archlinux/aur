# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Brent Carmer <bcarmer@gmail.com>

_pkg="gmp4"
_variant="static"
pkgname="${_pkg}-${_variant}"
pkgver=4.3.2
pkgrel=1
pkgdesc="Legacy version of gmp. Provides libgmp.so.3."
arch=('x86_64' 'i686')
url="http://gmplib.org/"
makedepends=('gcc')
license=('LGPL3')
depends=('gcc-libs' 'sh' 'gmp')
options=('!libtool')
source=(https://gmplib.org/download/archive/gmp-${pkgver}/gmp-${pkgver}.tar.xz)
sha256sums=('f69eff1bc3d15d4e59011d587c57462a8d3d32cf2378d32d30d008a42a863325')
sha512sums=('d2ddecc7d0bcfd158f65dfdc4650b9c7092abce52835887ed896cc79870036329ea6bef3f8337a5807bbb4321676366914832ae6a7874a0e54da0203591d03d1')

_configure_opts=(--prefix=/usr
                 --enable-static
                 --disable-shared
                 --libdir=/usr/lib
                 --includedir=/usr/lib/gmp
                 --enable-cxx
                 FLAGS=-fPIC
                 CPPFLAGS=-DPIC
                 LDFLAGS="-static")

build() {
  cd "gmp-${pkgver}"
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'
  ./configure ${_configure_opts[@]}
  make
}

package() {
  cd gmp-${pkgver}

  make DESTDIR="${pkgdir}" install

  #remove files that conflict with 'gmp' and 'lib32-gmp'
  rm -rf "${pkgdir}"/usr/share
  rm -rf "${pkgdir}"/usr/lib/gmp
  rm -rf "${pkgdir}"/usr/include
  mv "${pkgdir}/usr/lib/libgmp.a" "${pkgdir}/usr/lib/libgmp4.a"
  mv "${pkgdir}/usr/lib/libgmpxx.a" "${pkgdir}/usr/lib/libgmpxx4.a"
}
