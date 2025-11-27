# Maintainer: Gaurav Yadav <gauravyad69@gmail.com>
# Contributor: Alexey Galakhov

pkgname=canon-lbp2900-capt
pkgver=0.3.0
pkgrel=1
pkgdesc="CUPS driver for Canon LBP2900/LBP3000 CAPT printers (reverse-engineered)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/gauravyad69/Canon-LBP2900B"
license=('GPL-2.0-or-later')
depends=('cups' 'glibc')
makedepends=('autoconf' 'automake' 'cups')
provides=('captdriver')
conflicts=('captdriver')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gauravyad69/Canon-LBP2900B/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88e0cb030981230ec7fdbf65b08781b1f54dccbe5be1126dce1312762a3a6ac6')

build() {
    cd "Canon-LBP2900B-${pkgver}"
    
    aclocal
    autoconf
    automake --add-missing --copy
    
    ./configure --prefix=/usr
    make
}

package() {
    cd "Canon-LBP2900B-${pkgver}"
    
    # Install the filter
    install -Dm755 src/rastertocapt "${pkgdir}/usr/lib/cups/filter/rastertocapt"
    
    # Install the PPD file
    install -Dm644 Canon-LBP-2900.ppd "${pkgdir}/usr/share/cups/model/Canon-LBP-2900.ppd"
    
    # Install documentation
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 SPECS "${pkgdir}/usr/share/doc/${pkgname}/SPECS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
