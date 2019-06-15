_libressl_ver='2.9.2'
pkgname='letskencrypt'
pkgdesc="Secure Let's Encrypt client"
pkgver='0.1.16'
pkgrel='1'
license=('BSD')
url='https://kristaps.bsd.lv/letskencrypt/'
arch=('x86_64' 'i686')
depends=('libbsd')
source=("https://github.com/kristapsdz/letskencrypt-portable/archive/VERSION_${pkgver//\./_}.tar.gz"
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz")
sha512sums=('0b8dc0e0e2b4dda518f951fac3a1cce72c962abd6a15fb0e39d548ee24637b25d9f90312e6da0817e22adab7d0e5a4ddd86f65ae50c109cb2241481471c6bd80'
            'b43e73e47c1f14da3c702ab42f29f1d67645a4fa425441337bd6c125b481ef78a40fd13e6b34dadb2af337e1c0c190cfb616186d4db9c9a743a37e594b9b8033')

build () {
	# LibreSSL
	cd "${srcdir}/libressl-${_libressl_ver}"
	./configure --disable-shared --enable-static --prefix=/usr --sysconfdir=/etc
	make install DESTDIR="$(pwd)/prefix"

	cd "${srcdir}/acme-client-portable-VERSION_${pkgver//\./_}"
	make PREFIX=/usr \
		CPPFLAGS="-I${srcdir}/libressl-${_libressl_ver}/prefix/usr/include" \
		LDFLAGS="-L${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib"
}

package () {
	cd "${srcdir}/acme-client-portable-VERSION_${pkgver//\./_}"
	make PREFIX="${pkgdir}/usr" install

	# Fix manual page location
	if [[ -d ${pkgdir}/usr/man ]] ; then
		mkdir -p "${pkgdir}/usr/share"
		mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
	fi

	# Ensure that the default directory for certificates exists
	mkdir -p "${pkgdir}/etc/ssl/letsencrypt/private"
}
