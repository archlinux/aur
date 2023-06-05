# Maintainer: Yishen Miao <mys721tx at gmail dot com>
# Contributor: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=bcm5421-phy
_commit=56d25c8
pkgname=${_pkgbase}-dkms-git
pkgver=6.${_commit}
pkgrel=1
pkgdesc='Broadcom BCM5421 driver with PTP fix for Raspberry Pi 4B'
url=https://github.com/raspberrypi/linux/blob/${_commit}/drivers/net/phy/broadcom.c
arch=(any)
license=('GPL2')
depends=(dkms)
provides=(${_pkgbase}=${pkgver}-${pkgrel})
conflicts=(${_pkgbase})
source=(
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/net/phy/broadcom.c
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/net/phy/bcm-phy-lib.c
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/net/phy/bcm-phy-lib.h
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/net/phy/bcm-phy-ptp.c
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/include/linux/brcmphy.h
    dkms.conf
    Makefile
)
sha256sums=(
    'f591bed1a63eaf77301f48e752358af53c83f059e7ed6f669ced8848a7ad4e31'
    'a5085d707314e02758ed6d027ed2fd6e9a50b4ee9bb270844c618ea09c288643'
    '5fd457fa2da7182e100c7c6ae12079d7467c079c148c31142103f68ab70b9862'
    'f5ff8e859b584c39100cb93bc0041be6c904d10b1a0d4cbf1463503c04e467c3'
    'f80731dd1bf2183280663df55e8fdcc1cf07aed0493df206e7118ec1855731f3'
    'b7d8a4b697ab96da9a9982a1eefddd9dcc086fa5482ba5763d32505b2aa04c68'
    'c6d012d6189975cb36bd9fef1408aa13f550f95868135990ce1a92e3b4b4b03d'
)

prepare() {
    # Make the driver use local brcmphy.h copy with new values, as they are not yet upstreamed
    sed -i -e 's|<linux/brcmphy.h>|"brcmphy.h"|' broadcom.c bcm-phy-lib.c bcm-phy-lib.h
}

package() {
    install -Dm 644 Makefile broadcom.c bcm-phy-lib.c bcm-phy-lib.h bcm-phy-ptp.c brcmphy.h dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
