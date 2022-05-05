# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-static
_pkgname=openssl
_ver=1.1.1o
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (with static libs)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
backup=('etc/ssl/openssl.cnf')
options=('staticlibs')
provides=("openssl=$pkgver")
conflicts=('openssl')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
	'ca-dir.patch')
sha256sums=('9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f'
            'SKIP'
            '75aa8c2c638c8a3ebfd9fa146fc61c7ff878fc997dc6aa10d39e4b2415d669b2')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
	'7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd "$srcdir/$_pkgname-$_ver"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$_pkgname-$_ver"

	export CFLAGS="-fPIC ${CFLAGS}"
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$_pkgname-$_ver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i "$srcdir/ca-dir.patch"

	make test

	patch -p0 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from th patched .in file.
	make apps/CA.pl
}

package() {
	cd "$srcdir/$_pkgname-$_ver"

	make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
