# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Jan de Groot <jan@archlinux.org>

pkgname=lib32-gconf
pkgver=3.2.6+11+g07808097
pkgrel=7
pkgdesc="An obsolete configuration database system"
url="https://projects-old.gnome.org/gconf/"
arch=(x86_64)
license=(LGPL)
depends=(gconf lib32-dbus-glib lib32-gtk3 lib32-polkit)
makedepends=(intltool gtk-doc gobject-introspection git gnome-common gcc-multilib)
install=gconf.install
_commit=0780809731c8ab1c364202b1900d3df106b28626  # master
source=("lib32-gconf::git+https://gitlab.gnome.org/Archive/gconf.git#commit=$_commit"
        01_xml-gettext-domain.patch gconf-reload.patch)
sha256sums=('SKIP'
            'c883dec2b96978874a53700cfe7f26f24f8296767203e970bc6402b4b9945eb8'
            '567b78d8b4b4bbcb77c5f134d57bc503c34867fcc6341c0b01716bcaa4a21694')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Patch from fedora - reloads gconf after installing schemas
  patch -Np1 -i ../gconf-reload.patch

  # http://bugzilla.gnome.org/show_bug.cgi?id=568845
  patch -Np1 -i ../01_xml-gettext-domain.patch

  # The following line copied from Fedora
  # https://src.fedoraproject.org/rpms/GConf2/blob/70ed26d67b563d858a84505622d11f41879a6b37/f/GConf2.spec#_90
  2to3 --write --nobackup gsettings/gsettings-schema-convert

  sed -i '1s|#!/usr/bin/env python$|#!/usr/bin/python|' gsettings/gsettings-schema-convert

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib32 \
    --enable-defaults-service \
    --disable-gtk-doc \
    --disable-static \
    --disable-orbit
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}
