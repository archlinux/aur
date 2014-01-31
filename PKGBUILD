# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin' 'libpurple' 'finch')
pkgver=2.10.8
pkgrel=2
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'python2' 'hicolor-icon-theme' 'farstream-0.1' 'avahi'
             'tk' 'ca-certificates' 'intltool' 'networkmanager')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2{,.asc}
        pidgin-2.10.8-fix-login-issues-with-certain-xmpp-servers.patch)
sha256sums=('b633367e3588ff3e615d68e812302dfdbe32e73693cbe42a0d827b7aed7a8227'
            'SKIP'
            '4b4cc2d0816bbc7de83d34de6880935163007193a36dcc13afc89fc1ffacc5d2')
prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://developer.pidgin.im/ticket/15879
  patch -Np1 -i "$srcdir/pidgin-2.10.8-fix-login-issues-with-certain-xmpp-servers.patch"

  # Use Python 2
  sed -i 's/env python$/&2/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

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
           'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction')
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
  depends=('farstream-0.1' 'libsasl' 'libidn' 'dbus-glib' 'nss')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'python2-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')

  cd "$srcdir/pidgin-$pkgver"

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
}

package_finch(){
  pkgdesc="A ncurses-based messaging client"
  depends=("libpurple=$pkgver-$pkgrel" 'libx11' 'python2')

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
