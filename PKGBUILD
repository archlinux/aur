pkgname='sigmavpn'
pkgver='0.2'
pkgrel='4'
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
sha512sums=('5b2660a3993d83f8f8eadf1ef3ae677f0f348c5aeb8d569ac27d8c3227cda5b39ee29d3709c9d8b2878883d2aa4726a9dc4a5aa89bd6072a89c81d549eee340c'
            '4366c9f49253115bbee4b53a25bc5e27071bd25164d4e609d6f642e35d6c3367c4fb705771b5ed6e869cc51e7e900b13ef1c6dce400387e793a0f933a40b14aa'
            'c7815f85a2c7dd9159ff747b02a9d1a5f45e2330f8afb2281051c4d4ccea303255d56c363ceb1afaca0bbe6cbed28df23992654f2e0fb562fa616d6cb3803da1'
            'e08ca11165ba4635f6fc713fa7109bade00fcddd85b6d3e0924f8455f84e51c65bd7d25aff09935919949accc2e554c0158837d1afd6ae52090df753a997f727')
arch=('x86_64' 'i686' 'arm')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/fix-paths.patch"
	cp -v "${srcdir}/Makefile" .

	# Extract license text from main.c
	sed -e '1,/^$/{p}' -e d main.c > COPYING
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
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
