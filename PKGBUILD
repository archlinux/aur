pkgname=mysql-connector-odbc
replaces=('mariadb-connector-odbc-bin' 'mariadb-connector-odbc')
pkgver=8.0.21
pkgrel=1
pkgdesc="ODBC connector for MySQL instead of that mariadb nonsense"
arch=('x86_64' 'armv7h')
url="."
license=('GPL')
depends=('unixodbc' 'openssl' 'zlib' 'libmysqlclient')
makedepends=('git' 'cmake')
source=("https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-${pkgver}-src.tar.gz")

sha256sums=('c9e64754937f4b991144d6d58c6749df67556769369543faa9ee02b93289f9b5')

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
    make
}

package() {
    cd build
    mkdir -p ${pkgdir}/usr/lib ${pkgdir}/usr/bin
    install -m755 -o root -g root lib/*.so ${pkgdir}/usr/lib/
    install -m755 -o root -g root bin/* ${pkgdir}/usr/bin/
    rm -f ${pkgdir}/usr/bin/dltest
}
