# $Id: PKGBUILD,v 1.18 2008/04/05 15:20:51 dan Exp $
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pidgin
pkgver=2.4.1
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
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
        iconv-fix.patch)
md5sums=('ff015bb8bbdcc6a9b4ac954c355179d7'
         'de084bf1e2f345eada74671787256b74')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # fix some weird autoconf substitution bug, should report this upstream
  patch -p0 < ../iconv-fix.patch || return 1

  # gconf won't die with the --disable-schemas-install option
  sed -i -e 's/gconftool-2/no/g' configure.ac

  # ugly hack to support building with new libtool
  # http://developer.pidgin.im/ticket/5346
  # http://bugs.archlinux.org/task/10012
  libtoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-perl --disable-cap \
              --disable-schemas-install \
              --enable-gtkspell --enable-gnutls=yes \
              --enable-nss=no --disable-gevolution \
              --enable-dbus --disable-mono \
              --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
