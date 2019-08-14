# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Reventlov <contact@volcanis.me>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=libressl-side
pkgver=3.0.0
pkgrel=1
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
	'460fa390012218262b7c148a28e6ddfc0dc3d669c4bdd37b68bfa6f50a0cb2fb81a277fb46ae0ac22673aae5b5cc4476fe96e56471a6812176bf76e9c5e10838'
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
