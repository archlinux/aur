# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin' 'libpurple' 'finch')
pkgver=2.10.1
pkgrel=3
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'python2' 'hicolor-icon-theme' 'gstreamer0.10'
             'farstream' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        nm09-more.patch
        port-to-farstream-v2.patch)
sha256sums=('2f28bddc5edcd714d607d74126c8958ae7c258602b3929e3e6e783d3cb1beac8'
            '7e173ea37b86b604284da18ea015ee03ccd444f3e980f440c201957d37ee820e'
            '03ba48e0da1331a976efc28a66810be4f51599a2b8065ac449965e0aefca4482')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Further fixes for NetworkManager 0.9
  # http://developer.pidgin.im/ticket/13859
  patch -Np1 -i "$srcdir/nm09-more.patch"

  # Apply patch for farsight -> farstream transition
  # http://developer.pidgin.im/ticket/14936
  patch -Np1 -i "$srcdir/port-to-farstream-v2.patch"

  # The farstream patch changes configure.ac
  autoreconf -vi

  # Use Python 2
  sed -i 's/env python$/&2/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}

  # Pidgin doesn't explicitly link to libm
  LDFLAGS+=' -Wl,--copy-dt-needed-entries'

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --with-python=/usr/bin/python2 \
    --with-system-ssl-certs=/etc/ssl/certs
    make
}

package_pidgin(){
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'gstreamer0.10' 'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction'
              'ca-certificates: SSL CA certificates'
              'gstreamer0.10-good-plugins: video and voice support'
              'tk: Tcl/Tk scripting support')
  install=pidgin.install

  cd "$srcdir/pidgin-$pkgver"

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  install -Dm644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop

  rm "$pkgdir/usr/share/man/man1/finch.1"
}

package_libpurple(){
  pkgdesc="IM library extracted from Pidgin"
  depends=('farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss')
  optdepends=('avahi: Bonjour protocol support'
              'dbus-python: for purple-remote and purple-url-handler')

  cd "$srcdir/pidgin-$pkgver"

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
}

package_finch(){
  pkgdesc="A ncurses-based messaging client"
  depends=("libpurple=$pkgver-$pkgrel" 'python2' 'gstreamer0.10')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'tk: Tcl/Tk scripting support')

  cd "$srcdir/pidgin-$pkgver"

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir"/usr/share/man/man1/pidgin.1
}

# vim:set ts=2 sw=2 et:
