# Maintainer: Joe George <joe at externl dot com>

pkgname="zeroc-ice-php"
pkgver=3.6.3
pkgrel=1
pkgdesc="PHP bindings for Ice RPC framework"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "zeroc-ice=$pkgver"
    "php"
)

depends=("zeroc-ice=$pkgver" "php")

source=(
    "ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
    "ice-packaging-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice-packaging/archive/v${pkgver}.tar.gz"
)

sha256sums=('82ff74e6d24d9fa396dbb4d9697dc183b17bc9c3f6f076fecdc05632be80a2dc'
            '36f26dd60e90928e4b8cccfc5b72e572e11d3d987ff513f814001600f76dfa2e')

_make_args="OPTIMIZE=yes USE_BIN_DIST=yes embedded_runpath=prefix='' prefix=/usr"

build() {
    cd ${srcdir}/ice-${pkgver}/php

    msg "Building Ice for PHP"
    msg2 "Compiling..."
    make ${_make_args} -j`nproc` DESTDIR="${pkgdir}/"
}

package() {
    cd ${srcdir}/ice-${pkgver}/php
    make ${_make_args} DESTDIR="${pkgdir}/" install

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php/conf.d/
    echo "extension = IcePHP.so" > ${pkgdir}/etc/php/conf.d/ice.ini
    echo "include_path=${include_path}:/usr/share/Ice-${pkgver}/php/" >> ${pkgdir}/etc/php/conf.d/ice.ini

    # Put stuff into more possibly Arch Linux friendly places
    rm -rf ${pkgdir}/usr/share/Ice-${pkgver}/*
    rm -rf ${pkgdir}/usr/share/slice
    mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/Ice-${pkgver}/php
}

