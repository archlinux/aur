# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Branchini Massimo <max.bra.gtalk@gmail.com

_pkgname=libdbusmenu
pkgname=lib32-${_pkgname}-gtk2
pkgver=16.04.0
pkgrel=7
pkgdesc='Library for passing menus over DBus (GTK+ 2 library, 32-bit)'
url='https://launchpad.net/libdbusmenu'
arch=('x86_64')
license=('LGPL-2.1-only OR LGPL-3.0-only')
depends=("lib32-${_pkgname}-glib" 'lib32-gtk2' "${_pkgname}-gtk2")
makedepends=('gnome-common' 'glib2-devel' 'gobject-introspection' 'intltool' 'vala' 'valgrind-multilib')
options=('!emptydirs')
source=(https://launchpad.net/${_pkgname}/${pkgver%.?}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('ee9654ac4ed94bdebc94a6db83b126784273a417a645b2881b2ba676a5f67d7fc95dd2bb37bfb0890aa47299ed73cb21ed7de8b75f3fed6b69bfd39065062241'
            'SKIP')
validpgpkeys=('45B1103FB93ACBD90296DBCAE83D089481836EBF')  # Marco Trevisan (at 3v1n0.net) <marco.trevisan@3v1n0.net>

prepare() {
  cd ${_pkgname}-${pkgver}
  # don't treat warnings as errors
  sed -i 's/-Werror//' libdbusmenu-*/Makefile.{am,in}
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  export HAVE_VALGRIND_TRUE='#'
  export HAVE_VALGRIND_FALSE=''

  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-{dumper,static,tests} \
    --libdir=/usr/lib32 \
    --with-gtk=2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

# vim: ts=2 sw=2 et:
