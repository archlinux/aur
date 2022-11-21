# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: bitwave <aur at oomlu dot de>
# Contributor: willemw <willemw12 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=("libappindicator-bzr")
pkgver=12.10.0.r298
pkgrel=1
pkgdesc='A library to allow applications to export a menu into the Unity Menu bar. GTK3 Bzr version.'
url='https://launchpad.net/libappindicator'
arch=(x86_64)
license=(LGPL2.1 LGPL3)
makedepends=(dbus-glib gobject-introspection libdbusmenu-gtk3 libindicator-gtk3 vala gnome-common gtk-sharp-2 gtk-sharp-3 perl-xml-libxml bzr automake mono)
depends=(libdbusmenu-gtk3)
options=(!emptydirs)
source=('bzr+lp:libappindicator')
conflicts=(libappindicator-gtk3)
provides=(libappindicator-gtk3=$pkgver)

sha512sums=('SKIP')

pkgver() {
  cd libappindicator
  ver=`grep "AC_INIT" configure.ac -A1 | tail -1 | sed "s#        \[##" | sed "s#\],##"`
  _bzrrev=`bzr revno`
  echo "${ver}.r${_bzrrev}"
}

build() {
  # Without this gapi2-codegen will fail
  export CSC='/usr/bin/mcs'

  (cd libappindicator
    ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-gtk=3
    make -j1
  )
}

package() {
  cd libappindicator
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
