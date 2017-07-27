# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.12
pkgrel=2
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
	"bzip2: bzip2 compression support")
install="${pkgname}.install"
source=("https://github.com/dun/munge/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('551b3da8de11a50e2cfbdb19de5c2e64dae9d8082bc55219d4f532a48ba01e802e33bac920568cd8b36220d7bd892a6a6e2a963b63199224343eedf204657ce5')

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	# '--with-crypto-lib=libgcrypt' is a temporary workaround for an OpenSSL 1.1.0 conversion bug
	# refer to https://github.com/dun/munge/issues/54 for more information
	./configure \
		--with-crypto-lib=libgcrypt \
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
	chmod 0700 "${pkgdir}"/etc/munge
	chmod 0711 "${pkgdir}"/var/lib/munge
	chmod 0700 "${pkgdir}"/var/log/munge
}
