# Maintainer: Yun Dou <dixyes@gmail.com>

_name=swow
_upstream=swow/swow
pkgbase=php-swow
pkgname=('php-swow' 'php-legacy-swow')
pkgver=1.2.0
pkgrel=3
pkgdesc="Swow coroutine IO extension for PHP"
arch=('x86_64' 'arm64')
url="https://github.com/swow/swow"
license=('APACHE')
makedepends=('php' 'php-legacy')
depends=('glibc')
source=("$_name-$pkgver.tar.gz::https://github.com/${_upstream}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('eb39340483472c4c1adfd15742d4a2600ec44035fe339cd6b8dda3662c4a1d732dc43ec1f3d8dbd978aa1791e2668af515bc4a7286fb32879df9221dfa21e511')

prepare() {
    mv -v "${_name}-${pkgver}" "$pkgbase-$pkgver"

    echo -e "; the Swow extension requires curl to be activated first\n; and it's conflict with swoole\nextension=${_name}" > "$pkgbase-$pkgver/ext/${_name}.ini"

    cp -av "$pkgbase-$pkgver" "${pkgname[1]}-$pkgver"

    (
        cd "$pkgbase-$pkgver/ext"
        phpize
    )

    (
        cd "${pkgname[1]}-$pkgver/ext"
        phpize-legacy
    )
}

build() {
    (
        cd "$pkgbase-$pkgver/ext"
        ./configure \
            --prefix=/usr \
            --enable-swow-ssl \
            --enable-swow-curl
        make
    )

    (
        cd "${pkgname[1]}-$pkgver/ext"
        ./configure \
            --prefix=/usr \
            --enable-swow-ssl \
            --enable-swow-curl
        make
    )
}

check() {
    local EXTRA_PHPT_ARGS="-n --show-diff"
    (
        export TEST_PHP_EXECUTABLE=/usr/bin/php
        local TEST_PHP_ARGS="${EXTRA_PHPT_ARGS} -d extension=${srcdir}/${pkgbase}-${pkgver}/ext/modules/swow.so"
        cd "$pkgbase-$pkgver/ext"
        $TEST_PHP_EXECUTABLE run-tests.php . $TEST_PHP_ARGS
    )

    (
        export TEST_PHP_EXECUTABLE=/usr/bin/php-legacy
        local TEST_PHP_ARGS="${EXTRA_PHPT_ARGS} -d extension=${srcdir}/${pkgname[1]}-${pkgver}/ext/modules/swow.so"
        cd "${pkgname[1]}-$pkgver/ext"
        $TEST_PHP_EXECUTABLE run-tests.php . $TEST_PHP_ARGS
    )
}

package_php-swow() {
    backup=("etc/php/conf.d/${_name}.ini")
    depends+=('php')
    provides+=('php-swow')
    conflicts+=('php-swow')

    cd "$pkgbase-$pkgver/ext"
    make INSTALL_ROOT="$pkgdir/" install
    install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php/conf.d/"
}

package_php-legacy-swow() {
    backup=("etc/php-legacy/conf.d/${_name}.ini")
    depends+=('php-legacy')
    provides+=('php-legacy-swow')
    conflicts+=('php-legacy-swow')

    cd "${pkgname[1]}-$pkgver/ext"
    make INSTALL_ROOT="$pkgdir/" install
    install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php-legacy/conf.d/"
}
