# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mysql-router
pkgver=2.0.4
pkgrel=1
pkgdesc='Lightweight middleware that provides transparent routing between your application and any backend MySQL Servers'
arch=('i686' 'x86_64')
url='http://dev.mysql.com/downloads/router/'
license=('GPL')
makedepends=('cmake' 'doxygen' 'libmariadbclient')
backup=('etc/mysql/router.ini')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=("http://cdn.mysql.com/Downloads/MySQL-Router/${pkgname}-${pkgver}.tar.gz"{,.asc}
        'mysqlrouter.sysusers')
sha256sums=('c56ccd028c2429c8daff74050a37010f596634aef6844a7539175951eeb4b80a'
            'SKIP'
            '8db8c99262320402b4c2e811c960291fec4a2c951bbdc0564e615f50b4f85cac')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i '/^ExecStart/c ExecStart=/usr/bin/mysqlrouter --config /etc/mysql/router.ini' \
		packaging/rpm-oel/mysqlrouter.service
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	chmod 0755 "${pkgdir}"/usr

	# install config file
	install -D -m0644 doc/sample_mysqlrouter.ini "${pkgdir}"/etc/mysql/router.ini

	# install systemd files
	install -D -m0644 packaging/rpm-oel/mysqlrouter.service "${pkgdir}"/usr/lib/systemd/system/mysqlrouter.service
	install -D -m0644 "${srcdir}"/mysqlrouter.sysusers "${pkgdir}"/usr/lib/sysusers.d/mysqlrouter.conf
	install -D -m0644 packaging/rpm-oel/mysqlrouter.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mysqlrouter.conf
}

