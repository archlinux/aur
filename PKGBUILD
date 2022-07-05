# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Branchini Massimo <max.bra.gtalk@gmail.com

_pkgbase=libdbusmenu
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-glib" "${pkgbase}-gtk"{2,3})
pkgver=16.04.0
pkgrel=5
pkgdesc='Library for passing menus over DBus (32-bit)'
url='https://launchpad.net/libdbusmenu'
arch=('x86_64')
license=('GPL3' 'LGPL2.1' 'LGPL3')
makedepends=('gnome-common' 'gobject-introspection' 'lib32-gtk'{2,3} 'intltool' 'vala' 'valgrind-multilib')
options=('!emptydirs')
source=(https://launchpad.net/${_pkgbase}/${pkgver%.?}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz{,.asc})
sha512sums=('ee9654ac4ed94bdebc94a6db83b126784273a417a645b2881b2ba676a5f67d7fc95dd2bb37bfb0890aa47299ed73cb21ed7de8b75f3fed6b69bfd39065062241'
            'SKIP')
validpgpkeys=('45B1103FB93ACBD90296DBCAE83D089481836EBF')  # Marco Trevisan (at 3v1n0.net) <marco.trevisan@3v1n0.net>

prepare() {
  cd ${_pkgbase}-${pkgver}
  # don't treat warnings as errors
  sed -i 's/-Werror//' libdbusmenu-*/Makefile.{am,in}
  cd ..

  cp -ra ${_pkgbase}-${pkgver}{,-gtk2}
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  export HAVE_VALGRIND_TRUE='#'
  export HAVE_VALGRIND_FALSE=''

  msg2 "Building gtk3..."
  (cd ${_pkgbase}-${pkgver}
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-{dumper,static,tests} \
      --libdir=/usr/lib32 \
      --with-gtk=3
    make
  )

  msg2 "Building gtk2..."
  (cd ${_pkgbase}-${pkgver}-gtk2
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-{dumper,static,tests} \
      --libdir=/usr/lib32 \
      --with-gtk=2
    make
  )
}

package_lib32-libdbusmenu-glib() {
  depends=('lib32-glib2' "${_pkgbase}-glib")

  cd ${_pkgbase}-${pkgver}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

package_lib32-libdbusmenu-gtk2() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=('lib32-gtk2' "${pkgbase}-glib" "${_pkgbase}-gtk2")

  cd ${_pkgbase}-${pkgver}-gtk2
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

package_lib32-libdbusmenu-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=('lib32-gtk3' "${pkgbase}-glib" "${_pkgbase}-gtk3")

  cd ${_pkgbase}-${pkgver}
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share,lib,bin}
}

# vim: ts=2 sw=2 et:
