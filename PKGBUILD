# Maintainer: Leo <i@setuid0.dev>

_extname=ast
pkgname=php-$_extname
pkgver=1.1.1
pkgrel=1
pkgdesc='Extension exposing PHP 7 abstract syntax tree'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('BSD')
depends=('php>=7.1')
source=(
	"$pkgname-$pkgver.tar.gz::http://pecl.php.net/get/$_extname-$pkgver.tgz"
)
sha256sums=('0c55e09a4da43b9cc1da72ecb4ae892941f73e157b73d46326bc6a5ed7fc44b1')

prepare() {
	cd $srcdir/$_extname-$pkgver

#	for i in $srcdir/*.patch;
#	do patch -p1 < $i;
#	done

	echo "extension=$_extname" > $_extname.ini

	phpize

	./configure \
	--prefix=/usr \
	--with-ast
}

build() {
	cd $srcdir/$_extname-$pkgver
	make
}

check() {
	cd $srcdir/$_extname-$pkgver
	NO_INTERACTION=1 make test
}

package() {
	cd $srcdir/$_extname-$pkgver
	make INSTALL_ROOT=$pkgdir install
	install -Dm644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
}

