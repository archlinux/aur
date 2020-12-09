# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgbase=openssl
pkgname=(openssl openssl-doc openssl-perl)
_ver=1.1.1i
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
makedepends=('perl')
source=("https://www.openssl.org/source/${pkgname}-${_ver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha256sums=('e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242'
            'SKIP'
            '75aa8c2c638c8a3ebfd9fa146fc61c7ff878fc997dc6aa10d39e4b2415d669b2')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd "$srcdir/$pkgbase-$_ver"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$pkgbase-$_ver"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$pkgbase-$_ver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i "$srcdir/ca-dir.patch"

	make test
	
	patch -p0 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from th patched .in file.
	make apps/CA.pl
}

package_openssl() {
	pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
	depends=('glibc')
	optdepends=('ca-certificates')
	backup=('etc/ssl/openssl.cnf')

	cd "$srcdir/$pkgbase-$_ver"

	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs

	rm -rf $pkgdir/etc/ssl/misc $pkgdir/usr/bin/c_rehash
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_openssl-doc() {
	pkgdesc='Documentation provided with OpenSSL'
	depends=('openssl')

	cd "$srcdir/$pkgbase-$_ver"

	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_man_docs

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_openssl-perl() {
	pkgdesc='Perl scripts provided with OpenSSL'
	depends=('openssl' 'perl')

	cd "$srcdir/$pkgbase-$_ver"

	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_programs install_ssldirs

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	mv $pkgdir/etc/ssl/misc/* $pkgdir/usr/bin/
	rm -rf $pkgdir/{etc,usr/lib} $pkgdir/usr/bin/openssl
}
