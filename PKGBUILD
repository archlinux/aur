# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=3.0.5
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('Apache')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz"{,.asc}
	'ca-dir.patch')
sha256sums=('aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a'
            'SKIP'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
	'7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared enable-ktls enable-ec_nistp_64_gcc_128 linux-x86_64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$pkgbase-$pkgver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "$srcdir/ca-dir.patch"

	make test

	patch -Np1 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from the patched .in file.
	make apps/CA.pl
}

package() {
	depends+=('openssl-1.1') # remove after bootstrapping base
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
}
