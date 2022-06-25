# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.15
pkgrel=1
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
install="${pkgname}.install"
source=("munge.sysusers"
	"munge.tmpfiles"
	"https://github.com/dun/munge/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0f24af038db5924d483e12f884830636c5611aa6b2486cfdec2c47fa80eb47cefaa550e9be88207fb00a98fe77902504e019b87f384381cd3b2987bfda143c1b'
            '0a2da0528128c3f3272f4171ede5ecd1077a995c2b2bbf947521ffd90a9ddefd5204e802f5d016561c3e25ce39c47497841ccc831983ffbe3fa1eef18c81ce98'
            'e3736c7e3c18e27d7678bea3b75696ead17c50c7c8270cb4c3a61a20d750571b4eb8567626de26458659284f656a15d2a0b2a0dd8d45993af719e8ca6f6f4cc0')

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	./bootstrap
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--sysconfdir=/etc

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -D -m644 ../munge.sysusers "${pkgdir}/usr/lib/sysusers.d/munge.conf"
	install -D -m644 ../munge.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/munge.conf"

	# Securing the installation (this is optional)
	chmod 0700 "${pkgdir}"/etc/munge
	chmod 0711 "${pkgdir}"/var/lib/munge
	chmod 0700 "${pkgdir}"/var/log/munge
}
