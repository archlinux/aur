# Maintainer: Yun Dou <dixyes@gmail.com>

_name=swow
_upstream=swow/swow
_branch=develop
pkgbase=php-swow-git
pkgname=('php-swow-git' 'php-legacy-swow-git')
pkgver=1.2.0.r8.g6a901f36
pkgrel=1
pkgdesc="Swow coroutine IO extension for PHP, git \"${_branch}\" branch"
arch=('x86_64' 'arm64')
url="https://github.com/swow/swow"
license=('APACHE')
makedepends=('php' 'php-legacy')
depends=('glibc')
source=("${_name}-${_branch}::git+https://github.com/${_upstream}.git#branch=${_branch}")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${_name}-${_branch}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {

    echo -e "; the Swow extension requires curl to be activated first\n; and it's conflict with swoole\nextension=${_name}" > "${_name}-${_branch}/${_name}.ini"

    cp -av "${_name}-${_branch}" "${_name}-${_branch}-legacy"

    (
        cd "${_name}-${_branch}/ext"
        phpize
    )

    (
        cd "${_name}-${_branch}-legacy/ext"
        phpize-legacy
    )
}

build() {
    (
        cd "${_name}-${_branch}/ext"
        ./configure \
            --prefix=/usr \
            --enable-swow-ssl \
            --enable-swow-curl
        make
    )

    (
        cd "${_name}-${_branch}-legacy/ext"
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
        local TEST_PHP_ARGS="${EXTRA_PHPT_ARGS} -d extension=${srcdir}/${_name}-${_branch}/ext/modules/swow.so"
        cd "${_name}-${_branch}/ext"
        # since this is git, check may fail
        $TEST_PHP_EXECUTABLE run-tests.php $TEST_PHP_ARGS . || :
    )

    (
        export TEST_PHP_EXECUTABLE=/usr/bin/php-legacy
        local TEST_PHP_ARGS="${EXTRA_PHPT_ARGS} -d extension=${srcdir}/${_name}-${_branch}-legacy/ext/modules/swow.so"
        cd "${_name}-${_branch}-legacy/ext"
        # since this is git, check may fail
        $TEST_PHP_EXECUTABLE -n run-tests.php $TEST_PHP_ARGS . || :
    )
}

package_php-swow-git() {
    backup=("etc/php/conf.d/${_name}.ini")
    depends+=('php')
    provides+=('php-swow')
    conflicts+=('php-swow')

    cd "${_name}-${_branch}"
    make -C ext INSTALL_ROOT="$pkgdir/" install
    install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php/conf.d/"
}

package_php-legacy-swow-git() {
    backup=("etc/php-legacy/conf.d/${_name}.ini")
    depends+=('php-legacy')
    provides+=('php-legacy-swow')
    conflicts+=('php-legacy-swow')

    cd "${_name}-${_branch}-legacy"
    make -C ext INSTALL_ROOT="$pkgdir/" install
    install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php-legacy/conf.d/"
}
