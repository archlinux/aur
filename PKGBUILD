# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-apcu
_pkgbase="${pkgname#php56-}"
pkgver=4.0.11
pkgrel=3
pkgdesc="A userland caching module for php56"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/APCu"
license=('PHP')
depends=('php56>=5.6.27')
provides=("php-${_pkgbase}=${pkgver}-${pkgrel}")
backup=("etc/php56/conf.d/apcu.ini")
source=("https://pecl.php.net/get/${_pkgbase}-${pkgver}.tgz")
sha256sums=('454f302ec13a6047ca4c39e081217ce5a61bbea815aec9c1091fb849e70b4d00')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    phpize56
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php56 \
        --with-php-config=/usr/bin/php-config56 \
        --localstatedir=/var
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=apcu.so' > apcu.ini
    install -D -m644 apcu.ini "${pkgdir}/etc/php56/conf.d/apcu.ini"
    install -D -m644 apc.php "${pkgdir}/usr/share/php56-apcu/apc.php"
    install -D -m644 INSTALL "${pkgdir}/usr/share/doc/php56-apcu/install.txt"
}
