pkgname='sigmavpn'
pkgver='0.2'
pkgrel='3'
pkgdesc='Light-weight, secure and modular VPN solution'
url='https://github.com/neilalexander/sigmavpn/'
license=('BSD')
depends=('libsodium')
source=(
	"${url}/archive/v${pkgver}.tar.gz"
	fix-paths.patch
	Makefile
	sigmavpn.conf
)
sha1sums=('8fb0e9eb03a0650d10fc3589381944b6b19a437e'
          '59a308938341d1e13373b49ce482bb642fbc06fc'
          'fb0fc62c58049feee34247efe99d619d9f6459b6'
          'a5dd10b1599079f45bba4398fb295696c76cd9f2')
arch=('x86_64' 'i686' 'arm')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/fix-paths.patch"
	cp -v "${srcdir}/Makefile" .
}

build () {
	cd "${pkgname}-${pkgver}"
	eval "$(sed -e '/^CFLAGS=/p' -e d /etc/makepkg.conf)"
	eval "$(sed -e '/^LDFLAGS=/p' -e d /etc/makepkg.conf)"
	make USE_SODIUM=1 EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}"
}

package () {
	cd "${pkgname}-${pkgver}"
	install -m 755 -d "${pkgdir}/usr/bin"
	install -m 755 -t "${pkgdir}/usr/bin" \
		sigmavpn naclkeypair
	install -m 755 -d "${pkgdir}/usr/lib/sigmavpn"
	install -m 755 -t "${pkgdir}/usr/lib/sigmavpn" \
		intf_*.o proto_*.o
	install -m 755 -d "${pkgdir}/usr/share/man/man1"
	install -m 644 -t "${pkgdir}/usr/share/man/man1" \
		sigmavpn.1
	install -m 755 -d "${pkgdir}/etc"
	install -m 755 -t "${pkgdir}/etc" \
		"${srcdir}/sigmavpn.conf"
}
