# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-geoip
_pkgbase="${pkgname#php56-}"
pkgver=1.1.0
pkgrel=4
pkgdesc="GeoIP module for php56"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/geoip"
license=('PHP')
provides=("php-geoip=${pkgver}-${pkgrel}")
depends=('php56>=5.6.17-3' 'geoip')
backup=('etc/php56/conf.d/geoip.ini')
source=("https://pecl.php.net/get/geoip-${pkgver}.tgz")
sha256sums=('82c6deb7264d2ff7c4d6c45a7d27cff7ab097be965795e317e04a9c5b7be98b9')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    phpize56
    # ./configure --prefix=/usr
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php56 \
        --with-php-config=/usr/bin/php-config56 \
        --localstatedir=/var
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    # disable prompt to send test report
    export NO_INTERACTION=1
    make test
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=geoip.so' >geoip.ini
    install -Dm644 geoip.ini "$pkgdir/etc/php56/conf.d/geoip.ini"
}
