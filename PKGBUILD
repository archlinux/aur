# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php56-memcached
_pkgbase="${pkgname#php56-}"
pkgver=2.2.0
pkgrel=3
pkgdesc="php56 extension for interfacing with memcached via libmemcached library"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/memcached"
license=('PHP')
provides=("php-memcached=${pkgver}-${pkgrel}")
depends=('php56>=5.6.17-3' 'libmemcached')
backup=('etc/php56/conf.d/memcached.ini')
source=("https://pecl.php.net/get/memcached-${pkgver}.tgz")
sha256sums=('17b9600f6d4c807f23a3f5c45fcd8775ca2e61d6eda70370af2bef4c6e159f58')

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

    install -d "$pkgdir/etc/php56/conf.d"
    echo ';extension=memcached.so' >"$pkgdir/etc/php56/conf.d/memcached.ini"
}
