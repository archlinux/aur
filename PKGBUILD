# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
pkgver=4.0.7
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server PHP 7 Linux"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/msphpsql/tree/PHP-7.0-Linux"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://github.com/Microsoft/msphpsql/archive/$pkgver-Linux/$pkgname-$pkgver.tar.gz")
sha256sums=('2feb763ee71642c49f3792e730928447b54c450999c522841f1c95cad46eb313')
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
