# Maintainer: Luke Arms <luke@arms.to>

pkgname=pretty-php
pkgver=0.3.24
pkgrel=1
pkgdesc="The opinionated formatter for modern, expressive PHP"
arch=('any')
license=('MIT')
url='https://github.com/lkrms/pretty-php'
depends=('php' 'composer')
makedepends=('git')
source=("${pkgname}::git+https://github.com/lkrms/pretty-php.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    rm -rf build vendor
    # The repo needs to be in 'detached HEAD' state for Composer to get the root
    # package version from Git
    git -c advice.detachedHead=false checkout "v${pkgver}"
    composer install --no-plugins
}

build() {
    cd "${srcdir}/${pkgname}"
    ./build.sh
}

check() {
    cd "${srcdir}/${pkgname}/build"
    echo 'Checking output of `pretty-php.phar --version`'
    ./pretty-php.phar --version | grep -Fq "pretty-php v${pkgver}-"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${pkgname}/build"
    install -Dm755 pretty-php.phar "${pkgdir}/usr/bin/pretty-php"
}
