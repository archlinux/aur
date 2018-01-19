# Maintainer: Jérôme Groven <jerome.groven [at] gmail [dot] com>

pkgname=php70-memcached
_pkgbase="${pkgname#php70-}"
pkgver=3.0.4
pkgrel=1
pkgdesc="php70 extension for interfacing with memcached via libmemcached library"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/memcached"
license=('PHP')
provides=("php-memcached=${pkgver}-${pkgrel}")
depends=('php70>=7.0.26-1' 'libmemcached')
backup=('etc/php70/conf.d/memcached.ini')
source=("https://pecl.php.net/get/memcached-${pkgver}.tgz")
sha512sums=('d0a0f9e99cbcc6829528554551dfacf0d943d54d4be60c9da708de82913a2a0bed7c51d594ae3ecf0c13b56064739f074ce6ada5d7433bdc7e26e8caf9cf5ca2')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    phpize70
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php70 \
        --with-php-config=/usr/bin/php-config70 \
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

    install -d "$pkgdir/etc/php70/conf.d"
    echo ';extension=memcached.so' >"$pkgdir/etc/php70/conf.d/memcached.ini"
}
