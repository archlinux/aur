# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.13
pkgrel=1
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
install="${pkgname}.install"
source=("https://github.com/dun/munge/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a577e9824320849da1efce12b42a5cd9a591f6f9f42a38c5c26f787fd0f21021144a0b7bbb9fd0a46f1d72a49b355bfc5bc078ca55cf4bd7cf0c3b9b4797b2a9')

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

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

	# Remove obsolete init script (Arch Linux uses SystemD)
	rm -f "${pkgdir}"/etc/init.d/munge
	rmdir "${pkgdir}"/etc/init.d

	# It is bad practice to put package-files in /run
	# The dir /var/run/munge will be created in post_install, see .install
	rmdir "${pkgdir}"/var/run/munge
	rmdir "${pkgdir}"/var/run

	# Securing the installation (this is optional)
	chmod 0700 "${pkgdir}"/etc/munge
	chmod 0711 "${pkgdir}"/var/lib/munge
	chmod 0700 "${pkgdir}"/var/log/munge
}
