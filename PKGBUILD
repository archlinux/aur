# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Branchini Massimo <max.bra.gtalk@gmail.com

_pkgbase=libdbusmenu
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-glib" "${pkgbase}-gtk3")
_pkgver=18.10.20180917~bzr492+repack1
pkgver=${_pkgver%~*}
pkgrel=1
pkgdesc='Library for passing menus over DBus (32-bit)'
url='https://launchpad.net/libdbusmenu'
arch=('x86_64')
license=('LGPL-2.1-only OR LGPL-3.0-only')
makedepends=('gnome-common' 'gobject-introspection' 'lib32-gtk3' 'intltool' 'vala' 'valgrind-multilib' 'glib2-devel')
options=('!emptydirs')
source=(https://deb.debian.org/debian/pool/main/libd/libdbusmenu/libdbusmenu_${_pkgver}.orig.tar.xz)
sha512sums=('d69b723015015ea454e681fa6b91a922b6809756979b576554f48bd955768bd082882d76b832af21a66d6a231e04ff01f0febfd9f36231b9dc385fc15a5db089')
validpgpkeys=('45B1103FB93ACBD90296DBCAE83D089481836EBF')  # Marco Trevisan (at 3v1n0.net) <marco.trevisan@3v1n0.net>

prepare() {
  cd ${_pkgbase}-${_pkgver%+*}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  export HAVE_VALGRIND_TRUE='#'
  export HAVE_VALGRIND_FALSE=''

  cd ${_pkgbase}-${_pkgver%+*}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-{dumper,static,tests} \
    --libdir=/usr/lib32 \
    --with-gtk=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_lib32-libdbusmenu-glib() {
  depends=("${_pkgbase}-glib" 'lib32-glib2' 'lib32-glibc')

  cd ${_pkgbase}-${_pkgver%+*}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

package_lib32-libdbusmenu-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=("${_pkgbase}-gtk3" "${pkgbase}-glib" 'lib32-at-spi2-core' 'lib32-gdk-pixbuf2' 'lib32-glib2' 'lib32-glibc' 'lib32-gtk3' 'lib32-pango')

  cd ${_pkgbase}-${_pkgver%+*}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

# vim: ts=2 sw=2 et:
