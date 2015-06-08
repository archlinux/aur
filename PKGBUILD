# Maintainer: Figue <ffigue@gmail.com>
# Contributor: Pirea Radu <pirea.radu@gmail.com>

pkgname=cubieboard-livesuit
pkgver=306
pkgrel=1
pkgdesc="LiveSuit is a tool to flash Images to the NAND of Allwinner devices, such as Cubieboard1, Cubieboard2, and Cubietruck. This package use the ZIP that comes from official Cubieboard download page."
arch=('x86_64')
url="http://cubieboard.org"
license=('GPL')
depends=('libpng12' 'qt4')
makedepends=('git' 'dkms')
conflicts=()
install=${pkgname}.install
source=("${pkgname}"::'git+https://github.com/linux-sunxi/sunxi-livesuite.git'
	    "http://dl.cubieboard.org/software/tools/livesuit/LiveSuitV${pkgver}_For_Linux64.zip"
        "50-awusb.rules")
sha256sums=('SKIP'
            '12c042080e6b49e3edff7052cbb9ff0a89badce12be04d1443b1c9d5163d9bf3'
            '21e03a459c30fbf92bef5b086f8c93c6ac7071d97e7855dce7627e624969081f')

build() {
    # LiveSuit
    cd ${srcdir}/LiveSuit_For_Linux64
    tail -n +60 LiveSuit.run > LiveSuit.tar.bz2
	tar xjvf LiveSuit.tar.bz2

    # Kernel module awusb
    cd ${srcdir}/${pkgname}/awusb
    make
}

package() {
    # LiveSuit
    cd ${srcdir}/LiveSuit_For_Linux64
	mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r LiveSuit/* ${pkgdir}/opt/${pkgname}/

    # Kernel module awusb
    mkdir -p ${pkgdir}/usr/lib/modules/`uname -r`/kernel/ ${pkgdir}/etc/udev/rules.d
    cp ${srcdir}/${pkgname}/awusb/awusb.ko ${pkgdir}/usr/lib/modules/`uname -r`/kernel/
    cp ${srcdir}/50-awusb.rules ${pkgdir}/etc/udev/rules.d/
}
