# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=pidgin-gtkui
pkgname=('pidgin')
pkgver=2.14.14
pkgrel=4
arch=('x86_64')
url="https://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'libgadu' 'python' 'hicolor-icon-theme' 'farstream' 'tk'
             'libnsl' 'avahi' 'ca-certificates' 'intltool' 'libnm' 'dbus-glib'
             'libxcrypt')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/$pkgname-$pkgver.tar.bz2{,.asc})
sha256sums=('0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-gevolution \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --disable-consoleui \
    --with-system-ssl-certs=/etc/ssl/certs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_pidgin(){
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'gst-plugins-base' 'gst-plugins-good' 'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction')

  cd $pkgname-$pkgver

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  # https://bugs.archlinux.org/task/53770
  # https://bugs.archlinux.org/task/69026
  find "$pkgdir/usr/lib/perl5" -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
