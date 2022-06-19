# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

## GPG key: https://daniel.haxx.se/mykey.asc

pkgname=curl-git
pkgver=7.83.1.r187.g06fc95830
pkgrel=1
pkgdesc="An URL retrieval utility and library"
arch=('x86_64')
url="https://github.com/curl/curl"
license=('MIT')
depends=(
	'ca-certificates' 'brotli' 'libbrotlidec.so' 'libgssapi_krb5.so'
	'krb5' 'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so'
	'libssh2' 'libssh2.so' 'openssl' 'zlib' 'zstd' 'libzstd.so')
makedepends=('git')
provides=('libcurl.so' "curl=${pkgver%.r*}")
conflicts=('curl')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') ## Daniel Stenburg

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^curl-//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"

	./buildconf
	./configure \
			--prefix=/usr \
			--mandir=/usr/share/man \
			--disable-ldap \
			--disable-ldaps \
			--disable-manual \
			--enable-ipv6 \
			--enable-versioned-symbols \
			--enable-threaded-resolver \
			--with-gssapi \
			--with-libssh2 \
			--with-openssl \
			--with-random=/dev/urandom \
			--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

	make
}

package() {
	cd "$pkgname"

	make DESTDIR="$pkgdir" install
	make DESTDIR="$pkgdir" install -C scripts

	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
