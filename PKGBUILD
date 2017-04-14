# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
pkgver=4.1.8
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/msphpsql"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://github.com/Microsoft/msphpsql/archive/v$pkgver-preview/$pkgname-$pkgver.tar.gz")
sha256sums=('b31841b924a6de690b026c1a78f1f336506cd08125475be87a4d7c6366f81d59')
backup=('etc/php/conf.d/sqlsrv.ini')

build() {
	cd "$srcdir"/msphpsql-$pkgver-preview/source
	sh packagize.sh

	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver-preview/source/$ext
		phpize
		./configure --prefix=/usr
		make
	done
}

package() {
	for ext in sqlsrv pdo_sqlsrv; do
		cd "$srcdir"/msphpsql-$pkgver-preview/source/$ext
		make INSTALL_ROOT="$pkgdir" install
	done

	cd "$pkgdir"

	install -dm0755 etc/php/conf.d/
	echo -e "extension=sqlsrv.so\nextension=pdo_sqlsrv.so" > etc/php/conf.d/sqlsrv.ini

	install -Dm0644 "$srcdir"/msphpsql-$pkgver-preview/LICENSE usr/share/licenses/$pkgname/LICENSE
}
