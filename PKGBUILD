# Maintainer: Samleybrize <stephen.berquet at gmail dot com>
pkgname=php-ncurses
pkgver=1.0.2
pkgrel=3
pkgdesc="Terminal screen handling and optimization package"
url="http://pecl.php.net/package/ncurses"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'ncurses')
backup=('etc/php/conf.d/ncurses.ini')

source=(
    "http://pecl.php.net/get/ncurses-${pkgver}.tgz"
    'ncurses-php7-support.patch'
)

sha256sums=(
    '7fa4998d06a00a094276e5283fd6a408cbf78cd2d3b889fe6ab51be3780c9063'
    '24da58ba3126329d93701ebc68a0dc3993340883bf648006783bb4222c9a6b5c'
)

build() {
    phpver=$(php -r 'echo (int) phpversion();')
    cd "$srcdir/ncurses-$pkgver"

    if [ $phpver -ge 7 ]; then
        patch < ../../ncurses-php7-support.patch
    fi

    phpize
    ./configure --prefix=/usr --with-ncurses
    make
}

package() {
    cd "$srcdir/ncurses-$pkgver"

    make INSTALL_ROOT="$pkgdir" install
    echo 'extension=ncurses.so' > ncurses.ini 
    install -Dm644 ncurses.ini "$pkgdir/etc/php/conf.d/ncurses.ini"
}
