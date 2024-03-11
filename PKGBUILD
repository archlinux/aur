# Maintainer: somini <dev@somini.xyz>
# Contributor: Mr. Tao <tao@post.cz>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin-gnutls' 'libpurple-gnutls' 'finch-gnutls')
pkgbase=pidgin-gnutls
_pkgname="${pkgname%-gnutls}"
pkgver=2.14.13
pkgrel=1
arch=('x86_64')
url="https://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'gnutls' 'libsasl' 'libsm'
             'libidn' 'libgadu' 'python' 'hicolor-icon-theme' 'farstream' 'tk'
             'libnsl' 'avahi' 'ca-certificates' 'intltool' 'libnm' 'dbus-glib'
             'libgnt' 'libxcrypt')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/$_pkgname-$pkgver.tar.bz2{,.asc})
sha256sums=('120049dc8e17e09a2a7d256aff2191ff8491abb840c8c7eb319a161e2df16ba8'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-gevolution \
    --disable-meanwhile \
    --enable-gnutls=yes \
    --enable-nss=no \
    --with-gnutls-includes=/usr/include/gnutls \
    --with-gnutls-libs=/usr/lib \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --with-system-ssl-certs=/etc/ssl/certs
    make
}

package_pidgin-gnutls(){
  provides=('pidgin')
  conflicts=('pidgin')
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple-gnutls' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'gst-plugins-base' 'gst-plugins-good' 'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction')

  cd "$_pkgname-$pkgver"

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir/usr/share/man/man1/finch.1"

  # https://bugs.archlinux.org/task/53770
  # https://bugs.archlinux.org/task/69026
  find "$pkgdir/usr/lib/perl5" -name perllocal.pod -delete
}

package_libpurple-gnutls(){
  provides=('libpurple')
  conflicts=('libpurple')
  pkgdesc="IM library extracted from Pidgin"
  depends=('farstream' 'libsasl' 'libidn' 'libnsl' 'libgadu' 'dbus-glib' 'gnutls'
           'libnm' 'libxcrypt')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'python-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')

  cd "$_pkgname-$pkgver"

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done

  # https://bugs.archlinux.org/task/53770
  # https://bugs.archlinux.org/task/69026
  find "$pkgdir/usr/lib/perl5" -name perllocal.pod -delete
}

package_finch-gnutls(){
  provides=('finch')
  conflicts=('finch')
  pkgdesc="A ncurses-based messaging client"
  depends=('libpurple-gnutls' 'libgnt' 'libx11')

  cd "$_pkgname-$pkgver"

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir"/usr/share/man/man1/pidgin.1
}

# vim:set ts=2 sw=2 et:
