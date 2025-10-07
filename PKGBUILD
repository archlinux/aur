# Maintainer: Lily Anatia Wilson <hotaru@thinkindifferent.net>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
pkgname="$_pkgname-aegis"
pkgver=3.6.0
pkgrel=1
pkgdesc='OpenSSL with AEGIS cipher support added'
arch=('x86_64')
url="https://github.com/aegis-aead/$_pkgname"
license=('Apache-2.0')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
provides=("openssl=$pkgver" 'libcrypto.so' 'libssl.so')
conflicts=('openssl')
backup=('etc/ssl/openssl.cnf')
source=("$url/archive/refs/heads/$_pkgname-$pkgver-aegis.zip"
        'ca-dir.patch')
sha256sums=('12a3811e619bef5a2f9ed2ed5a3e885a16e643f9ab70383570cdcc151aac7e09'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7')
validpgpkeys=('EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
              'BA5473A2B0587B07FB27CF2D216094DFD0CB81EF')

prepare() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver-aegis"

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver-aegis"

	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared enable-ktls enable-ec_nistp_64_gcc_128 linux-${CARCH}

	make depend
	make
}

check() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver-aegis"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "$srcdir/ca-dir.patch"

	make HARNESS_JOBS=$(nproc) test

	patch -Np1 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from the patched .in file.
	make apps/CA.pl
}

package() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver-aegis"

	make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
