# Maintainer: Nicholas Yim <nickyim05@gmail.com>
# Maintainer: Leo <i@setuid0.dev>

_extname=event
pkgname=php-$_extname
pkgver=3.0.3
pkgrel=2
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('PHP')
depends=('php>=7.3' 'libevent')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('504185c1bc7d6b22ae3d256f82fab6561708610db35ea2773e9e4478174c7174')

build() {
    cd $srcdir/$_extname-$pkgver
    phpize
    ./configure \
    --prefix=/usr \
    --with-event-openssl \
    --with-event-extra \
    --enable-event-sockets
    make
    echo "extension=$_extname" > $_extname.ini
}

check() {
    cd $srcdir/$_extname-$pkgver
    NO_INTERACTION=1 make test
}

package() {
    pushd "$srcdir/$_extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
    popd
}
