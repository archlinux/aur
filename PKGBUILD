# Maintainer: Nicholas Yim <nickyim05@gmail.com>
# Maintainer: Leo <i@setuid0.dev>

_extname=event
pkgname=php-$_extname
pkgver=3.0.4
pkgrel=1
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('PHP')
depends=('php>=7.3' 'libevent>=2.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('3d585ec92ae7efc4a9eca0ed015ec0f73ff43d5e3c56cf15b36c904ef71fcb8f')

prepare() {
	cd $srcdir/$_extname-$pkgver

	echo "extension=$_extname" > $_extname.ini

	phpize

	./configure \
	--prefix=/usr \
	--with-event-core \
	--with-event-extra \
	--with-event-openssl \
	--with-event-sockets
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

