# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Branchini Massimo <max.bra.gtalk at gmail dot com

_pkgname=libdbusmenu
pkgname=libdbusmenu-gtk2
_bzrtag=16.04.0
_bzrrev=498
pkgver=${_bzrtag}.r${_bzrrev}
pkgrel=3
pkgdesc='Library for passing menus over DBus (GTK+ 2 library)'
url='https://launchpad.net/libdbusmenu'
arch=('x86_64')
license=('LGPL-2.1-only OR LGPL-3.0-only')
depends=("${_pkgname}-glib" 'gtk2')
makedepends=('breezy' 'gnome-common' 'glib2-devel' 'gobject-introspection' 'intltool' 'vala')
options=('!emptydirs')
source=($_pkgname::bzr+https://code.launchpad.net/~dbusmenu-team/libdbusmenu/trunk.16.10#revision=$_bzrrev)
sha512sums=('416e027702b1868e79266a763fc61395abecf3a0aa606243f56a385f4e2c619a744531e2c26bafb55c26b0123061078416e903f39046e8b0a7c5473c2bc5cac2')
validpgpkeys=('45B1103FB93ACBD90296DBCAE83D089481836EBF')  # Marco Trevisan (at 3v1n0.net) <marco.trevisan@3v1n0.net>

prepare() {
  cd ${_pkgname}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export HAVE_VALGRIND_TRUE='#'
  export HAVE_VALGRIND_FALSE=''

  cd ${_pkgname}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-{dumper,static,tests} \
    --with-gtk=2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
}

# vim: ts=2 sw=2 et:
