# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-1.1
_pkgname=openssl
_ver=1.1.1w
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=8
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('aarch64' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('glibc')
provides=('libcrypto.so' 'libssl.so')
makedepends=('perl')
source=(
	"https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
	'ca-dir.patch'
	CVE-2023-5678.patch
	CVE-2024-0727-1.patch
	CVE-2024-0727-2.patch
	CVE-2024-2511.patch
	CVE-2024-4741.patch
	CVE-2024-5535-1.patch
	CVE-2024-5535-2.patch
	CVE-2024-5535-3.patch
	CVE-2024-5535-4.patch
	CVE-2024-5535-5.patch
	CVE-2024-5535-6.patch
	CVE-2024-5535-7.patch
	CVE-2024-5535-8.patch
	CVE-2024-9143.patch
	CVE-2024-13176.patch
	CVE-2025-9230.patch
	CVE-2025-69419-1.patch
	CVE-2025-69419-2.patch
)
sha256sums=(
	'cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8'
	'SKIP'
	'75aa8c2c638c8a3ebfd9fa146fc61c7ff878fc997dc6aa10d39e4b2415d669b2'
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
)
validpgpkeys=(
	'8657ABB260F056B1E5190839D9C4D26D0E604491'
	'7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
	'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'
	'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
)

prepare() {
	cd "$srcdir/$_pkgname-$_ver"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/ca-dir.patch"

	patch -p1 -i "${srcdir}/CVE-2023-5678.patch"
	patch -p1 -i "${srcdir}/CVE-2024-0727-1.patch"
	patch -p1 -i "${srcdir}/CVE-2024-0727-2.patch"
	patch -p1 -i "${srcdir}/CVE-2024-2511.patch"
	patch -p1 -i "${srcdir}/CVE-2024-4741.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-1.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-2.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-3.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-4.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-5.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-6.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-7.patch"
	patch -p1 -i "${srcdir}/CVE-2024-5535-8.patch"
	patch -p1 -i "${srcdir}/CVE-2024-9143.patch"
	patch -p1 -i "${srcdir}/CVE-2024-13176.patch"
	patch -p1 -i "${srcdir}/CVE-2025-9230.patch"
	patch -p1 -i "${srcdir}/CVE-2025-69419-1.patch"
	patch -p1 -i "${srcdir}/CVE-2025-69419-2.patch"
}

build() {
	cd "$srcdir/$_pkgname-$_ver"

	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib/openssl-1.1 \
		shared no-ssl3-method enable-ec_nistp_64_gcc_128 "linux-${CARCH}"

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

	make DESTDIR="$pkgdir" install_sw

	# Move some files around
	install -m755 -d "$pkgdir/usr/include/openssl-1.1"
	mv "$pkgdir/usr/include/openssl" "$pkgdir/usr/include/openssl-1.1/"
	mv "$pkgdir/usr/lib/openssl-1.1/libcrypto.so.1.1" "$pkgdir/usr/lib/"
	mv "$pkgdir/usr/lib/openssl-1.1/libssl.so.1.1" "$pkgdir/usr/lib/"
	ln -sf ../libssl.so.1.1 "$pkgdir/usr/lib/openssl-1.1/libssl.so"
	ln -sf ../libcrypto.so.1.1 "$pkgdir/usr/lib/openssl-1.1/libcrypto.so"
	mv "$pkgdir/usr/bin/openssl" "$pkgdir/usr/bin/openssl-1.1"

	# Update includedir in .pc files
	sed -e 's|/include$|/include/openssl-1.1|' -i "$pkgdir"/usr/lib/openssl-1.1/pkgconfig/*.pc

	rm -rf "$pkgdir"/{etc,usr/bin/c_rehash}

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
