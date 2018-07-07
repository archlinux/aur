# Maintainer: Chris Morgan <me@chrismorgan.info>

pkgname=php56-maxminddb
pkgver=1.3.0
pkgrel=1
pkgdesc="MaxMind DB reader module for php56"
arch=("x86_64" "i686")
url="https://github.com/maxmind/MaxMind-DB-Reader-php"
license=("Apache-2.0")
provides=("php-maxminddb=${pkgver}-${pkgrel}")
depends=("php56" "libmaxminddb")
backup=("etc/php56/conf.d/maxminddb.ini")
source=("https://github.com/maxmind/MaxMind-DB-Reader-php/archive/v${pkgver}.tar.gz")
sha256sums=("2ee92d78da321c530c85646dc5c00e4312709d0ae3dec89a186c034b3c83c530")

_pkgsrcdir="MaxMind-DB-Reader-php-${pkgver}"

build() {
    cd "${srcdir}/${_pkgsrcdir}/ext"

    phpize56
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php56 \
        --with-php-config=/usr/bin/php-config56 \
        --localstatedir=/var
    make
}

check() {
    cd "${srcdir}/${_pkgsrcdir}/ext"
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1
}

package() {
    cd "${srcdir}/${_pkgsrcdir}/ext"

    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=maxminddb.so" > maxminddb.ini
    install -Dm644 maxminddb.ini "$pkgdir/etc/php56/conf.d/maxminddb.ini"
}
