# Contributro: Peter Lewis <prlewis@letterboxes.org>
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=poldi
pkgver=0.4.1
pkgrel=8
pkgdesc="PAM module for authentication using a smartcard"
arch=('i686' 'x86_64')
url="http://www.g10code.com/p-poldi.html"
license="GPL"
depends=('libgcrypt' 'libgpg-error' 'libksba' 'pam')
makedepends=()
optdepends=('logrotate: To avoid giant logfiles')
options=()
backup=("etc/poldi/poldi.conf" "etc/pam.d/system-auth-poldi")
install=poldi.install
source=("ftp://ftp.gnupg.org/gcrypt/alpha/poldi/$pkgname-$pkgver.tar.bz2"
	"poldi-arch.patch"
	"poldi.logrotate")

prepare() {
	sed -i \
		-e 's!\(#define GNUPG_DEFAULT_SCD\).*!\1 "/usr/lib/gnupg/scdaemon"!' \
		$srcdir/poldi-0.4.1/config.h.in
}

build() {

  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../poldi-arch.patch

  ./configure --prefix=/usr --with-pam-module-directory=/usr/lib/security --sysconfdir=/etc
  make CFLAGS+=-lgpg-error
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-conf-skeleton

  install -d -m 755 "$pkgdir/usr/share"
  mv "$pkgdir/etc/poldi" "$pkgdir/usr/share/poldi"
  rmdir $pkgdir/etc
  install -D -m 644 "$pkgdir/usr/share/poldi/poldi.conf"  "$pkgdir/etc/poldi/poldi.conf"

  install -d -m 755 "$pkgdir/usr/lib/security"
  cp src/pam/pam_poldi.so "$pkgdir/usr/lib/security/"
  cp tests/pam-test "$pkgdir/usr/bin/pam-test-poldi"

  install -d -m 755 "$pkgdir/etc/pam.d"
  echo -e "auth\tsufficient\tpam_poldi.so" > $pkgdir/etc/pam.d/system-auth-poldi

  install -d -m 755 "$pkgdir/etc/logrotate.d"
  install -m 755 ${srcdir}/poldi.logrotate $pkgdir/etc/logrotate.d/poldi

  rm "$pkgdir/usr/share/info/dir"
}
md5sums=('197986f9ba6aec9a91ee4610f4c6be8b'
         'a4187baaacc764d20909345865668280'
         '57009cc5211088396d2521fc1997792b')
