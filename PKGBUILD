# Contributro: Peter Lewis <prlewis@letterboxes.org>
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

_gitname=poldi
pkgname=${_gitname}-git
pkgver=r142.d9a9ff9
pkgrel=1
pkgdesc="PAM module for authentication using a smartcard"
arch=('i686' 'x86_64')
url="http://git.gnupg.org/cgi-bin/gitweb.cgi?p=poldi.git"
license=("GPL")
depends=('libgcrypt' 'libgpg-error' 'libksba' 'pam')
makedepends=('git' 'autoconf' 'automake')
optdepends=('logrotate: To avoid giant logfiles')
options=()
backup=("etc/poldi/poldi.conf" "etc/pam.d/system-auth-poldi")
install=poldi.install
conflicts=("poldi")
source=("${_gitname}::git://git.gnupg.org/${_gitname}/"
	# "poldi-arch.patch"
	"0001-Update-path-to-scdaemon.patch"
	"poldi.logrotate")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_gitname}"
  # sed -i \
  # 	-e 's!\(#define GNUPG_DEFAULT_SCD\).*!\1 "/usr/lib/gnupg/scdaemon"!' \
  # 	$srcdir/${_gitname}/config.h.in
  # Note sure how this file should be generated...
  sed -i /version.texi/d doc/poldi.texi
  # patch -p1 < ../poldi-arch.patch
  patch -p1 < ../0001-Update-path-to-scdaemon.patch
  ./autogen.sh
}

build() {
  cd "$srcdir/${_gitname}"

  ./configure --prefix=/usr --with-pam-module-directory=/usr/lib/security --sysconfdir=/etc
  make CFLAGS+=-lgpg-error
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-conf-skeleton

  install -d -m 755 "$pkgdir/usr/share"
  mv "$pkgdir/etc/poldi" "$pkgdir/usr/share/poldi"
  rmdir $pkgdir/etc
  install -D -m 644 "$pkgdir/usr/share/poldi/poldi.conf"  "$pkgdir/etc/poldi/poldi.conf"

  install -d -m 755 "$pkgdir/usr/lib/security"
  cp src/pam/pam_poldi.so "$pkgdir/usr/lib/security/"
  install -d -m 755 "$pkgdir/usr/bin"
  cp tests/pam-test "$pkgdir/usr/bin/pam-test-poldi"

  install -d -m 755 "$pkgdir/etc/pam.d"
  echo -e "auth\tsufficient\tpam_poldi.so" > $pkgdir/etc/pam.d/system-auth-poldi

  install -d -m 755 "$pkgdir/etc/logrotate.d"
  install -m 755 ${srcdir}/poldi.logrotate $pkgdir/etc/logrotate.d/poldi

  rm "$pkgdir/usr/share/info/dir"
}
md5sums=('SKIP'
         '6ccfe3af0362bca96d1d85aa097b5f1d'
         '57009cc5211088396d2521fc1997792b')
