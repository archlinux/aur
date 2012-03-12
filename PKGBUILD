# $Id$
# Contributro: Peter Lewis <prlewis@letterboxes.org>
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=poldi
pkgver=0.4.1
pkgrel=1
pkgdesc="PAM module for authentication using a smartcard"
arch=('i686' 'x86_64')
url="http://www.g10code.com/p-poldi.html"
license="GPL"
depends=('libgcrypt' 'libgpg-error' 'libksba' 'pam')
makedepends=()
options=()
backup=()
install=poldi.install
source=("ftp://ftp.gnupg.org/gcrypt/alpha/poldi/$pkgname-$pkgver.tar.bz2" "poldi-arch.patch")

build() {

  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../poldi-arch.patch

  ./configure --prefix=/usr --with-pam-module-directory=/lib/security --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-conf-skeleton

  mkdir -p "$pkgdir/usr/share/poldi"
  mv "$pkgdir/etc" "$pkgdir/usr/share/poldi"
  sed -i "s#^log-file.*#log-file /var/log/poldi.log#" "$pkgdir/usr/share/poldi/etc/poldi/poldi.conf"

  mkdir -p "$pkgdir/lib/security"
  cp src/pam/pam_poldi.so "$pkgdir/lib/security/"
  cp tests/pam-test "$pkgdir/usr/bin/pam-test-poldi"

  mkdir -p "$pkgdir/etc/pam.d"
  echo -e "auth\tsufficient\tpam_poldi.so" > $pkgdir/etc/pam.d/poldi

  rm "$pkgdir/usr/share/info/dir"
}
md5sums=('197986f9ba6aec9a91ee4610f4c6be8b'
         '3533f7b428e2c9a4bbfff2271ba24e5d')
