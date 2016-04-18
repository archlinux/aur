# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=munge-git
pkgver=1040.1d12405
pkgrel=1
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
makedepends=('git')
provides=('munge')
conflicts=('munge')
install="${pkgname}.install"
source=("${pkgname}"::"git+https://github.com/dun/munge.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--sysconfdir=/etc

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install

	# Remove obsolete init script (Arch Linux uses SystemD)
	rm -f "${pkgdir}"/etc/init.d/munge
	rmdir "${pkgdir}"/etc/init.d

	# It is bad practice to put package-files in /run
	# The dir /var/run/munge will be created in post_install, see .install
	rmdir "${pkgdir}"/var/run/munge
	rmdir "${pkgdir}"/var/run

	# Securing the installation (this is optional)
	chmod 0700 /etc/munge
	chmod 0711 /var/lib/munge
	chmod 0700 /var/log/munge
}
