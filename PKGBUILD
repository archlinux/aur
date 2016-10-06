# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
pkgver=4.0.5
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server PHP 7 Linux"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/msphpsql/tree/PHP-7.0-Linux"
license=('MIT')
depends=('php' 'unixodbc')
source=("https://github.com/Microsoft/msphpsql/archive/v$pkgver-Linux/$pkgname-$pkgver.tar.gz")
sha256sums=('ddf9cc7aa82175bbb12c8d84eb5fb2d0e731d7a9be6cdfb571206018dcf9b1fc')
backup=('etc/php/conf.d/sqlsrv.ini')

build() {
	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver-Linux/source/$ext
		phpize
		./configure --prefix=/usr
		make
	done
}

package() {
	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver-Linux/source/$ext
		make INSTALL_ROOT="$pkgdir" install
	done

	cd "$pkgdir"

	install -dm0755 etc/php/conf.d/
	echo -e "extension=sqlsrv.so\nextension=pdo_sqlsrv.so" > etc/php/conf.d/sqlsrv.ini

	install -Dm0644 "$srcdir"/msphpsql-$pkgver-Linux/LICENSE usr/share/licenses/$pkgname/LICENSE
}
