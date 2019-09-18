# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Max Nemeth <max.nemeth@gmail.com>
# Contributor: Henri Häkkinen <henuxd@gmail.com>

pkgname=pidgin-mini
pkgver=2.13.0
pkgrel=1
pkgdesc="A minimal version of Pidgin for sane XMPP / IRC users"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('gtk2' 'startup-notification' 'libxss' 'nss' 'hicolor-icon-theme')
makedepends=('ca-certificates' 'python')
provides=("pidgin" "libpurple")
conflicts=('pidgin' 'libpurple')
options=('!libtool')
install=pidgin.install
source=(https://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.bz2)
sha256sums=('2747150c6f711146bddd333c496870bfd55058bab22ffb7e4eb784018ec46d8f')

build() {
  cd "$srcdir/pidgin-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install \
    --disable-meanwhile --disable-nm --disable-perl --disable-gnutls \
    --disable-doxygen --disable-gtkspell --disable-gestures \
    --disable-consoleui --disable-tk --disable-tcl --disable-avahi \
    --disable-gstreamer --disable-farstream --disable-idn --disable-mono \
    --disable-vv --disable-nls --with-dynamic-prpls=jabber,irc \
    --with-system-ssl-certs=/etc/ssl/certs
  make
 }

 package() {
  cd "$srcdir/pidgin-$pkgver"
  make DESTDIR="$pkgdir" install
  sed -e 's/_//g' pidgin/data/pidgin.desktop.in > pidgin.desktop
  install -Dm644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop

  # Remove GConf schema file
  rm -rf "$pkgdir/etc"

  # Remove libpurple and pidgin development headers
  #rm -rf "$pkgdir/usr/include"

  # Remove pkgconfig scripts
  #rm -rf "$pkgdir/usr/lib/pkgconfig"

  # Remove libpurple aclocal macro file
  #rm -rf "$pkgdir/usr/share/aclocal"
}
