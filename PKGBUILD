# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pidgin
pkgver=2.4.2
pkgrel=1
pkgdesc="A GTK+-based messaging client"
arch=(i686 x86_64)
license=('GPL2')
url="http://pidgin.im"
depends=('startup-notification' 'gtkspell' 'libxss' 'gstreamer0.10' 'dbus-glib>=0.73')
makedepends=('pkgconfig' 'tk' 'avahi' 'intltool')
replaces=('gaim')
conflicts=('gaim')
provides=('gaim')
options=(!libtool)
install=pidgin.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # gconf won't die with the --disable-schemas-install option
  sed -i -e 's/gconftool-2/no/g' configure.ac

  # ugly hack to support building with new libtool
  # http://developer.pidgin.im/ticket/5346
  # http://bugs.archlinux.org/task/10012
  libtoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake --add-missing || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-perl --disable-cap \
              --disable-schemas-install \
              --enable-gtkspell --enable-gnutls=yes \
              --enable-nss=no --disable-gevolution \
              --enable-dbus --disable-mono \
              --disable-meanwhile --disable-nm \
              --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

md5sums=('2d10f9b6a5f0162cf88016ea2ca0a36d')
