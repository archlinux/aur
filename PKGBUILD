# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.14
pkgrel=2
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
            '33e3210634c1d5aa14597d70ec73c49aa83e9e0cea5c98a656099016876d2bf4dc8e1ec20426ee0baba9522be2e6a4422fa67a028ebf5e7c04f72f7daf0fd53f'
            'ea89428889e261b58db14d0ab37a32decda3a8c77fe81edd9ec347bfafe748133f3a8bbba2e2e625b829261060599a7a30a42310fbbd0ad71c0ef6e18dcd5940')

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

	# It is bad practice to put package-files in /run
	# The dir /var/run/munge will be created by systemd-tmpfiles
	rmdir "${pkgdir}"/var/run/munge
	rmdir "${pkgdir}"/var/run

	# Securing the installation (this is optional)
	chmod 0700 "${pkgdir}"/etc/munge
	chmod 0711 "${pkgdir}"/var/lib/munge
	chmod 0700 "${pkgdir}"/var/log/munge
}
