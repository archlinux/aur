# Maintainer: Yun Dou <dixyes@gmail.com>

_name=swow
_upstream=swow/swow
pkgbase=php-swow
pkgname=('php-swow' 'php-legacy-swow')
pkgver=1.3.1
pkgrel=0
pkgdesc="Swow coroutine IO extension for PHP"
arch=('x86_64' 'arm64')
url="https://github.com/swow/swow"
license=('APACHE')
makedepends=('php' 'php-legacy')
depends=('glibc')
source=("$_name-$pkgver.tar.gz::https://github.com/${_upstream}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1134439609b5252befed00b5904fb1bf502b495f278ad6d011eaa9ab971fcec8128ee8c947ee6dfc187850db8e5a902e8cf4372e8233b74ebaed1dca12684ef7')

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
