# Maintainer: Joe George <joe at externl dot com>

pkgname="zeroc-ice-php56"
pkgver=3.6.2
pkgrel=1
pkgdesc="PHP bindings for Ice RPC framework"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "zeroc-ice=$pkgver"
    "php56"
)

depends=("zeroc-ice=$pkgver" "php56")

source=(
    "ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
    "ice-packaging-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice-packaging/archive/v${pkgver}.tar.gz"
)

sha256sums=('5e9305a5eb6081c8f128d63a5546158594e9f115174fc91208f645dbe2fc02fe'
            'f838d1740ef9421151873f1e04c9afd89da7c73998991f73f7c66e8466f5de80')

_make_args="OPTIMIZE=yes USE_BIN_DIST=yes embedded_runpath=prefix='' prefix=/usr"

build() {
    cd ${srcdir}/ice-${pkgver}/php

    msg "Building Ice for PHP"
    msg2 "Compiling..."
    find . -name 'Make*' -exec sed -i -e 's/php\-config\ /php\-config56\ /g' {} \;
    find . -name 'Make*' -exec sed -i -e 's/shell\ php\ /shell\ php56\ /g' {} \;
    make ${_make_args} -j`nproc` DESTDIR="${pkgdir}/"
}

package() {
    cd ${srcdir}/ice-${pkgver}/php
    make ${_make_args} DESTDIR="${pkgdir}/" install

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php56/conf.d/
    echo "extension = IcePHP.so" > ${pkgdir}/etc/php56/conf.d/ice.ini
    echo "include_path=${include_path}:/usr/share/Ice-${pkgver}/php/" > ${pkgdir}/etc/php56/conf.d/ice.ini

    # Put stuff into more possibly Arch Linux friendly places
    rm -rf ${pkgdir}/usr/share/Ice-${pkgver}/*
    rm ${pkgdir}/usr/share/slice
    mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/Ice-${pkgver}/php
}


