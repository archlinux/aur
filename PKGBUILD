# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.14
pkgrel=1
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
install="${pkgname}.install"
source=("https://github.com/dun/munge/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ea89428889e261b58db14d0ab37a32decda3a8c77fe81edd9ec347bfafe748133f3a8bbba2e2e625b829261060599a7a30a42310fbbd0ad71c0ef6e18dcd5940')

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

	# It is bad practice to put package-files in /run
	# The dir /var/run/munge will be created in post_install, see .install
	rmdir "${pkgdir}"/var/run/munge
	rmdir "${pkgdir}"/var/run

	# Securing the installation (this is optional)
	chmod 0700 "${pkgdir}"/etc/munge
	chmod 0711 "${pkgdir}"/var/lib/munge
	chmod 0700 "${pkgdir}"/var/log/munge
}
