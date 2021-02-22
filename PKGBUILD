# Maintainer: Nicholas Yim <nickyim05@gmail.com>
# Maintainer: Leo <i@setuid0.dev>

extname=event
pkgname=php-$extname
pkgver=3.0.2r1
pkgrel=1
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.3' 'libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('5e99836878d721767b8a627e108433bea7fd8d34178186a5464f669a609b22c5')

build() {
    cd $srcdir/$extname-$pkgver
    phpize
    ./configure \
    --prefix=/usr \
    --with-event-openssl \
    --with-event-extra \
    --enable-event-sockets
    make
    echo "extension=$extname" > $extname.ini
}

check() {
	cd $srcdir/$extname-$pkgver
	NO_INTERACTION=1 make test
}

package() {
    pushd "$srcdir/$extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $extname.ini "$pkgdir/etc/php/conf.d/$extname.ini"
    popd
}
