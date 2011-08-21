# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin' 'libpurple' 'finch')
pkgver=2.10.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'python2' 'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10'
             'farsight2' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        nm09-more.patch)
md5sums=('e1453c9093c4f32beec19abd14069a3f'
         'a673659d86c7a65aa710f7c8c7feda82')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Further fixes for NetworkManager 0.9
  # http://developer.pidgin.im/ticket/13859
  patch -Np1 -i "$srcdir/nm09-more.patch"

  # Use Python 2
  sed -i 's/env python$/\02/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}

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
  depends=("libpurple=$pkgver-$pkgrel" 'startup-notification' 'gtkspell'
           'libxss' 'libsm' 'gstreamer0.10' 'hicolor-icon-theme')
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
  depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss')
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
