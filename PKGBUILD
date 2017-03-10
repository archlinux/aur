# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin' 'libpurple' 'finch')
pkgver=2.12.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'libgadu' 'python' 'hicolor-icon-theme' 'farstream'
             'avahi' 'tk' 'ca-certificates' 'intltool' 'networkmanager')
source=(https://bitbucket.org/pidgin/main/downloads/$pkgname-$pkgver.tar.bz2{,.asc}
        pidgin-py3-fixes.patch)
sha256sums=('8c3d3536d6d3c971bd433ff9946678af70a0f6aa4e6969cc2a83bb357015b7f8'
            'SKIP'
            '2ae003adc19c2012186a2efc68163843d2037bdaf7540347185bb872424e18da')
validpgpkeys=('364E2EB38EA6A8D61FB963AD75FE259AA8AC8032')

prepare() {
  cd $pkgbase-$pkgver
  patch -Np1 -i ../pidgin-py3-fixes.patch
}

build() {
  cd $pkgbase-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --with-system-ssl-certs=/etc/ssl/certs
    make
}

package_pidgin(){
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'gst-plugins-base' 'gst-plugins-good' 'hicolor-icon-theme')
  optdepends=('aspell: for spelling correction')

  cd $pkgbase-$pkgver

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
              'python-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')

  cd $pkgbase-$pkgver

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
}

package_finch(){
  pkgdesc="A ncurses-based messaging client"
  depends=('libpurple' 'libx11' 'python')

  cd $pkgbase-$pkgver

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir"/usr/share/man/man1/pidgin.1
}

# vim:set ts=2 sw=2 et:
