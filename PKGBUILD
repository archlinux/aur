# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.24.5
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('gtk2' 'pangomm' 'atkmm' 'glibmm-docs')
license=('LGPL')
options=('!emptydirs')
url="https://www.gtkmm.org/"
source=(https://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.24/${pkgbase}-${pkgver}.tar.xz)
sha256sums=('0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # glibmm 2.46 uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gtkmm() {
  pkgdesc="C++ bindings for gtk2"
  depends=('gtk2' 'pangomm' 'atkmm')
  cd "${srcdir}/${pkgbase}-${pkgver}"

  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile

  make DESTDIR="${pkgdir}" install
}

package_gtkmm-docs() {
  pkgdesc="Developer documentation for gtkmm v2"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C docs DESTDIR="${pkgdir}" install
}
