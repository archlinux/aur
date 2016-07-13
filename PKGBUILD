# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=php-tideways
pkgver=4.0.5
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
        "https://github.com/tideways/profiler/releases/download/v2.0.11/Tideways.php")
sha256sums=('b50e7a85cc0d530945d01b561984fb5f7a8dbbee67b4f2a43a528cf4b9c2acb3'
            '8ad327e8e6ea5c45b456ac9b32c6fc7b02b117849c02bd87f0581368358b4cd8')

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

