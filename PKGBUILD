# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Reventlov <contact@volcanis.me>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=libressl-side
pkgver=2.9.1
pkgrel=2
pkgdesc='libressl side-by-side with openssl'
url='http://www.libressl.org/'
arch=('x86_64')
license=('ISC' 'custom:OpenSSL')
depends=('glibc')
optdepends=('ca-certificates')
makedepends=('gawk')
backup=('etc/libressl/openssl.cnf')

source=(https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz{,.asc})
sha512sums=(
	'7051911e566bb093c48a70da72c9981b870e3bf49a167ba6c934eece873084cc41221fbe3cd0c8baba268d0484070df7164e4b937854e716337540a87c214354'
	'SKIP'
)

validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

prepare() {
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"
	cd "$srcdir/build"

	"$srcdir/libressl-$pkgver/configure" \
		--prefix=/usr \
		--with-openssldir=/etc/libressl \
		--libdir "/usr/lib/libressl" \
		--includedir "/usr/include/libressl" \
		--program-prefix "libressl-"
}

build() {
	cd "$srcdir/build"
	make
}

check() {
	cd "$srcdir/build"
	make check
}

package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
	install -Dm 644 "$srcdir/libressl-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}/etc/libressl/cert.pem"

	# Remove man pages because they conflict with openssl.
	rm -rf "${pkgdir}/usr/share/man"

	# Remove pkgconfig files since they won't work properly.
	rm -r "$pkgdir/usr/lib/libressl/pkgconfig"
}
