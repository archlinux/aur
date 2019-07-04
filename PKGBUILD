# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=php-xhprof-extension
pkgver=4.1.7
pkgrel=1
pkgdesc="Tideways XHProf Extension"
arch=('i686' 'x86_64')
url="https://github.com/tideways/php-xhprof-extension"
license=('Apache')
depends=('php>=5.4.0')
makedepends=('php' 'git')
provides=('php-xhprof-extension')
conflicts=('php-xhprof-extension' 'php-tideways')

source=("https://github.com/tideways/php-profiler-extension/archive/v$pkgver.tar.gz"
        "https://github.com/tideways/profiler/releases/download/v2.0.18/Tideways.php")
sha256sums=('3e32ceacc9eec481e27b5df6d06de1e634294e2af9a64fe069bc686dba54fcb8'
            'f42634018d6af06cedf8ed2f12f7f5f705db46e9dabf5b3cd3700826f75af4b9')

build() {
    cd "$srcdir/php-xhprof-extension-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/php-xhprof-extension-$pkgver"
    export NO_INTERACTION=1
    make test
    echo
}

package() {
    cd "$srcdir/php-xhprof-extension-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=tideways.so' > tideways.ini
    echo ';tideways.api_key=set your key' >> tideways.ini
    install -Dm644 ../Tideways.php "$pkgdir/usr/lib/php/modules/Tideways.php"
    install -Dm644 tideways.ini "$pkgdir/etc/php/conf.d/tideways.ini"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

