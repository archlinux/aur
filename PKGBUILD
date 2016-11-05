_libressl_ver='2.5.0'
pkgname='acme-client'
pkgdesc="Secure Let's Encrypt client"
pkgver='0.1.14'
pkgrel='1'
license=('BSD')
url='https://kristaps.bsd.lv/acme-client/'
arch=('x86_64' 'i686')
depends=('libbsd')
source=("https://github.com/kristapsdz/acme-client-portable/archive/VERSION_${pkgver//\./_}.tar.gz"
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz"
		README.archlinux)
sha512sums=('03058da278da9c5a53940a5ba289e1d2eac52e57ef565fb061e9d2093b8baac77f7ec299a4deecfac9b02286d62d9fac198595ca2ba7d2b502be5adc4a41b5ab'
            '6372b27f1696e957389646a05b0572ad6936443b34fee0e57153b063831e00318fa1b434e3e0369f0c3df872e15ad3bee2f85db0851021444612f2a6f266a332'
            '0a1d1baad45510687e66fafb44459a503f6688a73f7ceb402c204b096dee4e56ea2e9f71ed6f59421b81acf854a3d39395739a5a063c1536d557e3eccac6cee4')
replaces=('letskencrypt')
provides=('letskencrypt')

prepare () {
	cd "${srcdir}/${pkgname}-portable-VERSION_${pkgver//\./_}"
	# Remove this definition, we'll pass a value below.
	sed -i -e '/^#define[[:space:]]\+WWW_DIR\b/d' main.c
}

build () {
	# LibreSSL
	cd "${srcdir}/libressl-${_libressl_ver}"
	./configure --disable-shared --enable-static --prefix=/usr --sysconfdir=/etc
	make install DESTDIR="$(pwd)/prefix"

	cd "${srcdir}/${pkgname}-portable-VERSION_${pkgver//\./_}"
	local wwwdir='-DWWW_DIR=\""/srv/http/acme\""'
	make PREFIX=/usr \
		CPPFLAGS="-I${srcdir}/libressl-${_libressl_ver}/prefix/usr/include ${wwwdir}" \
		LDFLAGS="-L${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib"
}

package () {
	cd "${srcdir}/${pkgname}-portable-VERSION_${pkgver//\./_}"
	make PREFIX="${pkgdir}/usr" install

	# Fix manual page location
	if [[ -d ${pkgdir}/usr/man ]] ; then
		mkdir -p "${pkgdir}/usr/share"
		mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
	fi

	# Custom license
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Additional documentation
	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 README.archlinux \
		"${pkgdir}/usr/share/doc/${pkgname}/README.archlinux"

	# Ensure that the default directories for certificates and challenges exist
	mkdir -p "${pkgdir}/etc/acme" \
		"${pkgdir}/etc/ssl/acme/private" \
		"${pkgdir}/srv/http/acme"
}
