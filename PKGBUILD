# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=php-tideways
pkgver=4.0.3
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
        "https://github.com/tideways/profiler/releases/download/v2.0.10/Tideways.php")
sha256sums=('2faab0fd3e1f4df9ffafbdabdad7a1ab753e4a0be5610c31df6f93d9357b01bd'
            '93fc0e5fc5c8269a5af80b96cb85decf605c1590dcc1304930597049404bbb3d')

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

