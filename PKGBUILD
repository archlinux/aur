_libressl_ver='2.5.1'
pkgname='acme-client'
pkgdesc="Secure Let's Encrypt client"
pkgver='0.1.16'
pkgrel='1'
license=('custom:ISC')
url='https://kristaps.bsd.lv/acme-client/'
arch=('x86_64' 'i686')
depends=('libbsd')
source=("https://kristaps.bsd.lv/acme-client/snapshots/${pkgname}-portable-${pkgver}.tgz"
	"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz"
	README.archlinux LICENSE.md)
sha512sums=('730c20bdf9d72b24e66c54b009a282e04da3ea8ce3b9eb053750672c53c9586b2879d87a565ddbab033d7ba6a577dd6399313b20cf654b185905db4de988b6b7'
            '44557c7c3e6bc9c0af9ae83b26765be9707d53708a32a5a945108a49ea20503afa4197919801830d27821c069b87e0e0edd284bd1b8a85340dbc0da2c162c2f9'
            '0a1d1baad45510687e66fafb44459a503f6688a73f7ceb402c204b096dee4e56ea2e9f71ed6f59421b81acf854a3d39395739a5a063c1536d557e3eccac6cee4'
            'b3580f1332469005c03b695ba1c5bc4d36accd2983f8d59f9fe6ce5616b208f1a7c65ad9c3d6a28d4b196ee765d07753e9c1308b5428408ccb3d5049b69c970c')
replaces=('letskencrypt')
provides=('letskencrypt')

prepare () {
	cd "${srcdir}/${pkgname}-portable-${pkgver}"
	# Remove this definition, we'll pass a value below.
	sed -i -e '/^#define[[:space:]]\+WWW_DIR\b/d' main.c
}

build () {
	# LibreSSL
	cd "${srcdir}/libressl-${_libressl_ver}"
	./configure --disable-shared --enable-static --prefix=/usr --sysconfdir=/etc
	make install DESTDIR="$(pwd)/prefix"

	cd "${srcdir}/${pkgname}-portable-${pkgver}"
	local wwwdir='-DWWW_DIR=\""/srv/http/acme\""'
	make PREFIX=/usr \
		CPPFLAGS="-I${srcdir}/libressl-${_libressl_ver}/prefix/usr/include ${wwwdir}" \
		LDFLAGS="-L${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib"
}

package () {
	cd "${srcdir}/${pkgname}-portable-${pkgver}"
	make PREFIX="${pkgdir}/usr" install

	# Fix manual page location
	if [[ -d ${pkgdir}/usr/man ]] ; then
		mkdir -p "${pkgdir}/usr/share"
		mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
	fi

	# Custom license
	install -Dm644 "${srcdir}/LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Additional documentation
	install -Dm644 "${srcdir}/README.archlinux" \
		"${pkgdir}/usr/share/doc/${pkgname}/README.archlinux"

	# Ensure that the default directories for certificates and challenges exist
	mkdir -p "${pkgdir}/etc/acme" \
		"${pkgdir}/etc/ssl/acme/private" \
		"${pkgdir}/srv/http/acme"
}
