# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin' 'libpurple' 'finch')
pkgver=2.10.11
pkgrel=6
_rev=cbc4db14444c91f4f4b03aa1b228c2d51dacea6b
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'libgadu' 'python2' 'hicolor-icon-theme' 'farstream'
             'avahi' 'tk' 'ca-certificates' 'intltool' 'networkmanager'
             'mercurial')
source=(pidgin::hg+https://bitbucket.org/pidgin/main#revision=$_rev)
sha256sums=('SKIP')

prepare() {
  cd $pkgbase

  # Revert change that breaks rejoining multi-user chats
  # https://developer.pidgin.im/ticket/16724
  {
    hg diff -c 136a5e95a1ad
    hg diff -c 187b51ce9922
  } | patch -Rp1

  # Use Python 2
  sed -i 's/env python$/&2/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}
}

build() {
  cd $pkgbase

  ./autogen.sh \
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
           'gst-plugins-base' 'gst-plugins-good' 'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction')
  install=pidgin.install

  cd $pkgbase

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir/usr/share/man/man1/finch.1"
}

package_libpurple(){
  pkgdesc="IM library extracted from Pidgin"
  depends=('farstream' 'libsasl' 'libidn' 'libgadu' 'dbus-glib' 'nss')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'python2-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')

  cd $pkgbase

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
}

package_finch(){
  pkgdesc="A ncurses-based messaging client"
  depends=('libpurple' 'libx11' 'python2')

  cd $pkgbase

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir"/usr/share/man/man1/pidgin.1
}

# vim:set ts=2 sw=2 et:
