# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-static
_pkgname=openssl
_ver=3.0.7
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (with static libs)'
arch=('x86_64')
url='https://www.openssl.org'
license=('Apache')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
provides=('libcrypto.so' 'libssl.so' "openssl=$pkgver")
backup=('etc/ssl/openssl.cnf')
options=('staticlibs')
conflicts=('openssl')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
	'ca-dir.patch')
sha256sums=('83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e'
            'SKIP'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C')

prepare() {
	cd "$srcdir/$_pkgname-$_ver"

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$_pkgname-$_ver"

	export CFLAGS="-fPIC ${CFLAGS}"
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared enable-ktls enable-ec_nistp_64_gcc_128 linux-x86_64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$_pkgname-$_ver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "$srcdir/ca-dir.patch"

	make HARNESS_JOBS=$(nproc) test

	patch -Np1 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from the patched .in file.
	make apps/CA.pl
}

package() {
	cd "$srcdir/$_pkgname-$_ver"

	make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
