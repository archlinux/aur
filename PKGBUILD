# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.12
pkgrel=1
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
conflicts=('munge-git')
install="${pkgname}.install"
source=("https://github.com/dun/munge/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('3e10b37d509025b49dda4f49c4c81c76')

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

	# /usr/sbin is deprecated in Arch Linux
	sed -i 's/\/usr\/sbin/\/usr\/bin/g' "${pkgdir}"/usr/lib/systemd/system/munge.service

	# It is bad practice to put package-files in /run
	# The dir /var/run/munge will be created in post_install, see .install
	rmdir "${pkgdir}"/var/run/munge
	rmdir "${pkgdir}"/var/run

	# Securing the installation (this is optional)
	chmod 0700 /etc/munge
	chmod 0711 /var/lib/munge
	chmod 0700 /var/log/munge
}
