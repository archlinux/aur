# Maintainer: Atle Solbakken <atle@goliathdns.no>

pkgname=quictls-openssl
pkgver=3.0.9+quic1
pkgrel=1
pkgdesc="TLS/SSL and crypto library with QUIC APIs, replacement for OpenSSL."
arch=('x86_64')
url="https://github.com/quictls/openssl"
license=('Apache')
depends=('glibc')
makedepends=('perl' 'git')
optdepends=('ca-certificates' 'perl')
conflicts=('openssl' 'openssl-perl' 'openssl-doc')
provides=('openssl' 'libcrypto.so' 'libssl.so')
# Do not add replaces=('openssl') per guidelines
backup=('etc/ssl/openssl.cnf')
source=("git+https://github.com/quictls/openssl#tag=openssl-3.0.9-quic1")
md5sums=('SKIP')

# PKGBUILD based on
#    https://github.com/archlinux/svntogit-packages/blob/master/openssl/trunk/PKGBUILD 
#
# Update this PKGBUILD as needed to match it as closely as possible

pkgver() {
	printf "3.0.9+quic1"
}

prepare() {
	cd "$srcdir/openssl"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/../ca-dir.patch"

	# use default openssl shlib version (without 81. prefix found in the fork)
	patch -p0 -i "$srcdir/../shlib-version.patch"
}

build() {
	cd "$srcdir/openssl"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
	    shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
	    "-Wa,--noexecstack" ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}

	make depend
	make -j 4
}

check() {
	cd "$srcdir/openssl"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i "$srcdir/../ca-dir.patch"

	make HARNESS_JOBS=$(nproc) test

	patch -p0 -i "$srcdir/../ca-dir.patch"

	# re-run make to re-generate CA.pl from th patched .in file.
	make apps/CA.pl
}

package() {
	cd "$srcdir/openssl"

	make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licences/$pkgname/LICENSE.txt"
}
