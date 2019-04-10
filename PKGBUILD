# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ilya Kuznetsov <monochrome.r42@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=mysql-connector-c++
pkgver=1.1.9
pkgrel=2
pkgdesc='A MySQL database connector for C++'
arch=('i686' 'x86_64')
url='http://dev.mysql.com/doc/connector-cpp/en/'
license=('GPL')
depends=('libmariadbclient')
makedepends=('cmake' 'boost')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5') # MySQL Release Engineering <mysql-build@oss.oracle.com>
source=("https://mirrors.sohu.com/mysql/Connector-C++/${pkgname}-${pkgver}.tar.gz"{,.asc}
	'0001-mysql-connector-c++-mariadb-api.patch'
	'0002-mysql-connector-c++-no-JSON.patch')
sha256sums=('3e31847a69a4e5c113b7c483731317ec4533858e3195d3a85026a0e2f509d2e4'
            'SKIP'
            '1694ead0b9c9cb7803a76f56e3871b4f64f045a07fa390cf18bc15be798035ee'
            '92de10ee54cb8f8c5b98a85ce441372375a6056d7180f584aaa223a7513812e2')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	# MariaDB does not have this, but it is optional
	patch -Np1 < "${srcdir}/0001-mysql-connector-c++-mariadb-api.patch"

	# MariaDB will add JSON support in 10.2... No JSON for now.
	patch -Np1 < "${srcdir}/0002-mysql-connector-c++-no-JSON.patch"
}

build() {
	mkdir build/
	cd build/

	cmake "../${pkgname}-${pkgver}/" \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DMYSQLCPPCONN_BUILD_EXAMPLES=OFF \
		-DMYSQL_LIB=/usr/lib/libmysqlclient.so
	make
}

package() {
	cd build/

	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/usr/{COPYING,README,Licenses_for_Third-Party_Components.txt,lib/libmysqlcppconn-static.a}
}

