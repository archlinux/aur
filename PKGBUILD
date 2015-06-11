# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=php-tideways
pkgver=2.0.7
pkgrel=1
pkgdesc="Tideways Profiler PHP Extension"
arch=('i686' 'x86_64')
url="https://github.com/tideways/php-profiler-extension"
license=('Apache')
depends=('php>=5.4.0')
makedepends=('php' 'git')
provides=('php-tideways')
conflicts=('php-tideways')

source=("https://github.com/tideways/php-profiler-extension/archive/v$pkgver.tar.gz"
        "https://github.com/tideways/profiler/releases/download/v2.0.1/Tideways.php")
sha256sums=('885257d4215a2d8e7402b20132ecfe2bf749148569f27e8b122832bbe7b1e351'
            '6d1bf02e28e9af11fb5b7a006e0daa8c469c38c35267fa2f2fe9b33269bcd041')

build() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    export NO_INTERACTION=1
    make test
    echo
}

package() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=tideways.so' > tideways.ini
    echo ';tideways.api_key=set your key' >> tideways.ini
    install -Dm644 ../Tideways.php "$pkgdir/usr/lib/php/modules/Tideways.php"
    install -Dm644 tideways.ini "$pkgdir/etc/php/conf.d/tideways.ini"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

