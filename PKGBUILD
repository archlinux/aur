# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ilya Kuznetsov <monochrome.r42@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=mysql-connector-c++
pkgver=1.1.6
pkgrel=4
pkgdesc='A MySQL database connector for C++'
arch=('i686' 'x86_64')
url='http://dev.mysql.com/doc/connector-cpp/en/'
license=('GPL')
depends=('libmariadbclient')
makedepends=('cmake' 'boost')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=("http://cdn.mysql.com/Downloads/Connector-C++/${pkgname}-${pkgver}.tar.gz"{,.asc}
	'0001-mysql-connector-c++-mariadb-api.patch')
sha256sums=('ad710b3900cae3be94656825aa70319cf7a96e1ad46bf93e07275f3606f69447'
            'SKIP'
            '1694ead0b9c9cb7803a76f56e3871b4f64f045a07fa390cf18bc15be798035ee')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	patch -Np1 < "${srcdir}/0001-mysql-connector-c++-mariadb-api.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	cmake . -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DMYSQLCPPCONN_BUILD_EXAMPLES=OFF \
		-DMYSQL_LIB=/usr/lib/libmysqlclient.so
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/usr/{ANNOUNCEMENT,COPYING,README,INSTALL,Licenses_for_Third-Party_Components.txt,lib/libmysqlcppconn-static.a}
}

