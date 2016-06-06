_libressl_ver='2.3.5'
pkgname='letskencrypt'
pkgdesc="Secure Let's Encrypt client"
pkgver='0.1.6'
pkgrel='1'
license=('BSD')
url='https://kristaps.bsd.lv/letskencrypt/'
arch=('x86_64' 'i686')
depends=('libbsd')
source=("https://github.com/kristapsdz/letskencrypt-portable/archive/VERSION_${pkgver//\./_}.tar.gz"
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz")
sha512sums=('e01381fad3b77c6c5b52901339f72fcf141de74c3f237b7619996d8400c79c35ec521b4efea94c661029c4ef877a28df5783111b0b656efe92625338df687798'
            'b73271ee05ba1bdffbfde02f17a33acf38738a4dfbe69be1bdd8f13a1f03a5fdab4c62a5f62f94c4128ad0d7ad1e6796e554c772d9f0563c61b7da75a8bb1e23')

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

	# Ensure that the default directory for certificates exists
	mkdir -p "${pkgdir}/etc/ssl/letsencrypt/private"
}
