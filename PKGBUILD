# Maintainer: Leo <i@setuid0.dev>

_extname=ast
pkgname=php-$_extname
pkgver=1.0.11
pkgrel=1
pkgdesc='Extension exposing PHP 7 abstract syntax tree'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('BSD')
depends=('php>=7.0')
source=(
    "http://pecl.php.net/get/$_extname-$pkgver.tgz"
)
sha256sums=(
    '4a74f6c20f69029e6673f7cc7b49021fcfc4cca6f9eb697c58c5018220457d1e'
)

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

