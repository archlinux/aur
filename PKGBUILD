# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-hardened
_ver=1.1.1i
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
backup=('etc/ssl/openssl.cnf')
provides=(openssl)
conflicts=(openssl)
source=("https://artfiles.org/openssl.org/source/openssl-1.1.1i.tar.gz"
	'ca-dir.patch')
sha256sums=('SKIP'
	    'SKIP')
#validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
#	       '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd "$srcdir/openssl-$_ver"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/openssl-$_ver"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 no-ssl2 no-ssl3 no-weak-ssl-ciphers no-ssl no-deprecated no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-tls1_2 no-tls1_2-method enable-tls1_3 no-rc2 no-rc4 no-idea no-seed -DOPENSSL_USE_IPV6=0 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

#check() {
#	cd "$srcdir/openssl-$_ver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
#	patch -p0 -R -i "$srcdir/ca-dir.patch"

#	make test

#	patch -p0 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from th patched .in file.
#	make apps/CA.pl
#}

package() {
	cd "$srcdir/openssl-$_ver"

	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/openssl/LICENSE
}
