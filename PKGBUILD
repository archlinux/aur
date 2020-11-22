pkgname=mysql-connector-odbc
replaces=('mariadb-connector-odbc-bin' 'mariadb-connector-odbc')
pkgver=8.0.22
pkgrel=1
pkgdesc="ODBC connector for MySQL instead of that mariadb nonsense"
arch=('x86_64' 'armv7h')
url="."
license=('GPL')
depends=('unixodbc' 'openssl' 'zlib' 'libmysqlclient')
makedepends=('git' 'cmake')
source=("https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-${pkgver}-src.tar.gz")

sha256sums=('8c3894d072cad5866cf07d09e05890bcce960dd2c23501b90952505f3ae5f4e8')

prepare() {
    rm -Rf build
    mkdir build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DWITH_UNIXODBC=1 \
	-DDISABLE_GUI=1 \
        ../$pkgname-$pkgver-src
    make myodbc8a myodbc8w
}

package() {
    cd build
    mkdir -p ${pkgdir}/usr/lib
    install -m744 -o root -g root lib/*.so ${pkgdir}/usr/lib/
}
