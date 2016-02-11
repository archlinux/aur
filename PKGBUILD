# Maintainer: Matthew Boswell <mordervomubel+archlinux at lockmail.us>
# Previous Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Previous Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: William Overstreet <william.ab.overstreet@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>


pkgname=libpurple-meanwhile
pkgver=2.10.12
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
pkgdesc="Pidgin Instant Messenger plugin for Sametime support"
makedepends=('make' 'libtool' 'pkg-config' 'glib2' 'libxml2'
             'meanwhile' 'libpurple')
depends=('glib2' 'meanwhile' 'libpurple')
provides=('libpurple-meanwhile')
options=('!libtool')
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2)
sha256sums=('2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd')

build() {
  cd "$srcdir/pidgin-$pkgver"

  # Override all the defaults, the plugin only needs the basics - this
  # prevents all sorts of extra libraries being linked to the finished
  # libsametime.so that a user may have installed, as well as avoiding
  # auto-detection of TCL/TK and so forth.
  PKG_CONFIG="" \
  GLIB_CFLAGS="$(pkg-config --cflags 'glib-2.0 >= 2.16.0 gobject-2.0 gmodule-2.0 gthread-2.0')" \
  GLIB_LIBS="$(pkg-config --libs 'glib-2.0 >= 2.16.0 gobject-2.0 gmodule-2.0 gthread-2.0')" \
  LIBXML_CFLAGS="$(pkg-config --cflags 'libxml-2.0 >= 2.6.0')" \
  LIBXML_LIBS="$(pkg-config --libs 'libxml-2.0 >= 2.6.0')" \
  MEANWHILE_CFLAGS="$(pkg-config --cflags 'meanwhile >= 1.0.0 meanwhile < 2.0.0')" \
  MEANWHILE_LIBS="$(pkg-config --libs 'meanwhile >= 1.0.0 meanwhile < 2.0.0')" \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-python=/usr/bin/python2 \
    --with-dynamic-prpls=sametime \
    --enable-silent-rules \
    --enable-shared \
    --disable-gtkui \
    --disable-consoleui \
    --disable-screensaver \
    --disable-sm \
    --disable-startup-notification \
    --disable-gtkspell \
    --disable-gestures \
    --disable-schemas-install \
    --disable-gstreamer \
    --disable-gstreamer-interfaces \
    --disable-farstream \
    --disable-vv \
    --disable-idn \
    --disable-avahi \
    --disable-fortify \
    --disable-dbus \
    --disable-nls \
    --disable-nm \
    --disable-nss \
    --disable-perl \
    --disable-gnutls \
    --disable-tcl \
    --disable-tk \
    --disable-pixmaps-install \
    --disable-doxygen \
    --disable-dot \
    --disable-devhelp

  cd "$srcdir/pidgin-$pkgver/libpurple/protocols/sametime"
  make 
}

package(){
  cd "$srcdir/pidgin-$pkgver"
  make -C "libpurple/protocols/sametime" DESTDIR="$pkgdir" install
}

