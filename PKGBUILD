# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sebastian Vandekerckhove <sebastianvdk(at)foxatwork(dot)be>
# Contributor: Ivan Abdulin <elbahek@gmail.com>

pkgname=mysql-proxy
pkgver=0.8.5
pkgrel=4
pkgdesc='Monitors, analyzes and transformations communication between the MySQL client and server'
arch=('i686' 'x86_64')
url='http://dev.mysql.com/downloads/mysql-proxy/'
license=('GPL')
depends=('lua51' 'glib2' 'libevent')
makedepends=('libmysqlclient')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
backup=('etc/mysql/proxy.cnf')
source=("http://dev.mysql.com/get/Downloads/MySQL-Proxy/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.asc"
	'mysql-proxy.service'
	'proxy.cnf')
sha256sums=('e5bac3df8bca2eed41cdbf09439264b34c77339cfe1eda506b0d76eaa2d2b2d5'
            'SKIP'
            'c3fa54b83b3c2dd6c50a7f86286c88c51a061c8497640c0199fd61f3ce506f50'
            '95170a086c5da94c8b1362fd5cd1ad3c9e75abe950faed362d0bd3710894ac94')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--datadir=/usr/share/${pkgname} \
		--with-lua=lua5.1
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/mysql-proxy.service" "${pkgdir}/usr/lib/systemd/system/mysql-proxy.service"
	install -D -m0640 "${srcdir}/proxy.cnf" "${pkgdir}/etc/mysql/proxy.cnf"
}

