# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Aljosha Papsch <papsch.al@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>

pkgname=network-manager-applet-gtk2
_pkgname=network-manager-applet
pkgver=0.9.8.9
pkgrel=1
pkgdesc="GNOME frontends to NetWorkmanager compiled for gtk2"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=0.9.8" libsecret gtk2 libnotify
         gnome-icon-theme mobile-broadband-provider-info iso-codes)
makedepends=(intltool gobject-introspection modemmanager)
options=('!emptydirs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=network-manager-applet.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/0.9/$_pkgname-$pkgver.tar.xz)
sha256sums=('b93d7bf49456b7932e233f562bf9531a3f3ff10946c942126159b92b3dda25c3')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's,Gtk-3.0,Gtk-2.0,' -i src/libnm-gtk/Makefile.in
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-more-warnings \
      --disable-maintainer-mode \
      --disable-migration \
      --without-bluetooth \
      --with-modem-manager-1 \
      --with-gtkver=2

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make V=0
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
