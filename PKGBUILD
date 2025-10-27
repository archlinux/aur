# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=pidgin
pkgname=('libpurple' 'finch')
pkgver=2.14.14
pkgrel=4
arch=('x86_64')
url="https://pidgin.im/"
license=('GPL')
makedepends=('nss' 'libsasl' 'libidn' 'libgadu' 'python' 'farstream' 'tk'
             'libnsl' 'avahi' 'ca-certificates' 'intltool' 'libnm' 'dbus-glib'
             'libgnt' 'libxcrypt')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/$pkgbase-$pkgver.tar.bz2{,.asc})
sha256sums=('0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

build() {
  cd $pkgbase-$pkgver

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
    --disable-gtkui \
    --with-system-ssl-certs=/etc/ssl/certs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libpurple(){
  pkgdesc="IM library extracted from Pidgin"
  depends=('farstream' 'libsasl' 'libidn' 'libnsl' 'libgadu' 'dbus-glib' 'nss'
           'libnm' 'libxcrypt')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'python-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')

  cd $pkgbase-$pkgver

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done

  # https://bugs.archlinux.org/task/53770
  # https://bugs.archlinux.org/task/69026
  find "$pkgdir/usr/lib/perl5" -name perllocal.pod -delete
}

package_finch(){
  pkgdesc="ncurses-based messaging client"
  depends=('libpurple' 'libgnt' 'libx11')

  cd $pkgbase-$pkgver

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES
}

# vim:set ts=2 sw=2 et:
