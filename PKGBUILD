# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor (Arch): Nathan Owe <ndowens04 at gmail>
_pkgname=anubis
pkgname=$_pkgname-smtp
pkgver=4.3
pkgrel=3
pkgdesc="An SMTP message submission daemon. "
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/anubis/"
license=('GPL-3.0-or-later')
depends=('gdbm' 'glibc' 'gnutls' 'gsasl' 'guile' 'libmariadbclient' 'pam' 'pcre')
# 'postgresql-libs'
makedepends=('emacs') # for anubis-mode
conflicts=('anubis')
source=(http://ftp.gnu.org/gnu/anubis/$_pkgname-$pkgver.tar.gz)
md5sums=('bc80b9045b3c8f3b1d6798200cd81586')

build() {
  cd $srcdir/$_pkgname-$pkgver
  CFLAGS="$CFLAGS -std=gnu17"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-guile \
              --with-pam \
              --with-mysql \
              --with-pcre \
              --without-tcp-wrappers \
              --with-socks-proxy
#--with-postgres disable for now, some include error

  # For some reason the GUILE_INCLUDES variable is set but not used
  # during build.
  make CFLAGS="$CFLAGS $(guile-config compile)"
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
