# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.10.1
pkgrel=2
pkgdesc='Lightweight X11 desktop panel for LXDE (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3' 'alsa-lib' 'menu-cache' 'lxmenu-data' 'libfm-gtk3' 'libkeybinder3')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
sha256sums=('1e318f57d7e36b61c23a504d03d2430c78dad142c1804451061f1b3ea5441ee8')

prepare() {
  cd $_pkgname-$pkgver

  # Disable pager plugin as it breaks panel layout with GTK+ 3
  # https://sourceforge.net/p/lxde/bugs/773/
  sed -i '/pager.c/d' plugins/Makefile.am
  sed -i '/STATIC_PAGER/d' src/private.h
  sed -i 's/libwnck-3.0//' configure.ac
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  CFLAGS+=" -Wno-incompatible-pointer-types" \
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr \
    --enable-gtk3

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
