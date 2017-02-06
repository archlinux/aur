# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
pkgver=4.1.6
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/msphpsql"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://github.com/Microsoft/msphpsql/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b4fbc2ac04090e016c2ee168622213cc4dde99f3f82a6b88608fee6dd1a54d0b')
backup=('etc/php/conf.d/sqlsrv.ini')

build() {
	cd "$srcdir"/msphpsql-$pkgver/source
	sh packagize.sh

	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver/source/$ext
		phpize
		./configure --prefix=/usr
		make
	done
}

package() {
	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver/source/$ext
		make INSTALL_ROOT="$pkgdir" install
	done

	cd "$pkgdir"

	install -dm0755 etc/php/conf.d/
	echo -e "extension=sqlsrv.so\nextension=pdo_sqlsrv.so" > etc/php/conf.d/sqlsrv.ini

	install -Dm0644 "$srcdir"/msphpsql-$pkgver/LICENSE usr/share/licenses/$pkgname/LICENSE
}
