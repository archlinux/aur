# Maintainer: Atle Solbakken <atle@goliathdns.no>

pkgname=quictls-openssl
pkgver=3.1.5+quic1
pkgrel=0
pkgdesc="TLS/SSL and crypto library with QUIC APIs based on OpenSSL."
#pkgdesc="TLS/SSL and crypto library with QUIC APIs, replacement for OpenSSL."
arch=('x86_64')
url="https://github.com/quictls/openssl"
license=('Apache')
depends=('glibc')
makedepends=('perl' 'git')
optdepends=('ca-certificates' 'perl')
# [atle 2024-02-02] Package can not longe provide openssl for Arch packages.
#                   Curl and possibly others now require 3.2 version, and it
#                   is not possible to patch from the quictls project on top
#                   of that as 3.2 has a separate quic implementation with
#                   name collisions.
# [atle 2024-02-02] For now, this package will be installed in /opt/quictls-openssl
#                   directory instead and users must have stock openssl alongside.
# conflicts=('openssl' 'openssl-perl' 'openssl-doc')
# provides=('openssl' 'libcrypto.so' 'libssl.so')
# Do not add replaces=('openssl') per guidelines
backup=('etc/ssl/openssl.cnf')
source=("git+https://github.com/quictls/openssl#tag=opernssl-3.1.5-quic1")
md5sums=('SKIP')

# PKGBUILD based on
#    https://github.com/archlinux/svntogit-packages/blob/master/openssl/trunk/PKGBUILD 
#
# Update this PKGBUILD as needed to match it as closely as possible

pkgver() {
	printf "3.1.5+quic"
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

	# [atle 2024-02-02] Use /opt install path, se comments above.

	#./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
	#    shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
	#    "-Wa,--noexecstack" ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/opt/quictls-openssl --openssldir=etc/ssl --libdir=lib \
	    shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
	    "-Wa,--noexecstack" ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}

	make depend
	make -j$(nproc)
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

	# [atle 2024-02-02] Use /opt install path, se comments above.

	#make DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	#install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	make DESTDIR="$pkgdir" MANDIR=/opt/quictls-openssl/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	install -D -m644 LICENSE.txt "$pkgdir/opt/quictls-openssl/usr/share/licenses/$pkgname/LICENSE.txt"
}
