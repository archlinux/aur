pkgname=php72-memcached
_pkgbase="${pkgname#php72-}"
pkgver=3.1.5
pkgrel=1
pkgdesc="php72 extension for interfacing with memcached via libmemcached library"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/memcached"
license=('PHP')
provides=("php-memcached=${pkgver}-${pkgrel}")
depends=('php72' 'libmemcached')
checkdepends=('memcached')
backup=('etc/php72/conf.d/memcached.ini')
source=("https://pecl.php.net/get/memcached-${pkgver}.tgz")
sha512sums=('87d5fd079fcaad81139785d6766da71b23a1a0fe907d4b22f3a787af148a20412c11df11c4d98c165241658baf0d87c8a6b29de15db07a0f9d1fabc8aec8f0e9')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    phpize72
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php72 \
        --with-php-config=/usr/bin/php-config72 \
        --localstatedir=/var
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    memcached_pids=()
    memcached -p 11211 -U 11211 >/dev/null        & memcached_pids+=($!)
    memcached -p 11212 -U 11212 >/dev/null        & memcached_pids+=($!)
    memcached -s "$PWD/memcached.sock" >/dev/null & memcached_pids+=($!)

    local ret=0
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1 || ret=1

    kill ${memcached_pids[@]}

    return $ret
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    make INSTALL_ROOT="$pkgdir" install

    install -d "$pkgdir/etc/php72/conf.d"
    echo 'extension=memcached.so' >"$pkgdir/etc/php72/conf.d/memcached.ini"
}
