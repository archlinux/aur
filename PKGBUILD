_libressl_ver='2.4.2'
pkgname='acme-client'
pkgdesc="Secure Let's Encrypt client"
pkgver='0.1.11'
pkgrel='1'
license=('BSD')
url='https://kristaps.bsd.lv/acme-client/'
arch=('x86_64' 'i686')
depends=('libbsd')
source=("https://github.com/kristapsdz/acme-client-portable/archive/VERSION_${pkgver//\./_}.tar.gz"
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz")
sha512sums=('8fb0a73076ddcfd6a0a8da9a810d2f65e1cace051a8841fca7f466c9a6488307239be669a951c95481a2bb1c703e9e53e3149c4369a9fd71cfe6af4f5a31736f'
            'abacecb318a787f5ef9d8469638b7485fe237d4d993f410d7da8c0773ab8eff8c7da988fe965f793b268711afe599dc28f994eedeaa2aafebeb40faa30af38db')
replaces=('letskencrypt')
provides=('letskencrypt')

build () {
	# LibreSSL
	cd "${srcdir}/libressl-${_libressl_ver}"
	./configure --disable-shared --enable-static --prefix=/usr --sysconfdir=/etc
	make install DESTDIR="$(pwd)/prefix"

	cd "${srcdir}/${pkgname}-portable-VERSION_${pkgver//\./_}"
	make PREFIX=/usr \
		CPPFLAGS="-I${srcdir}/libressl-${_libressl_ver}/prefix/usr/include" \
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

	# Ensure that the default directories for certificates and challenges exist
	mkdir -p "${pkgdir}/etc/ssl/letsencrypt/private" "${pkgdir}/var/www/letsencrypt"
}
