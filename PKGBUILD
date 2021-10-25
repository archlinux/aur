# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=rpi-poe-fan
_commit=b422a76
pkgname=rpi-poe-fan-dkms-git
pkgver=3.${_commit}
pkgrel=1
pkgdesc='Hwmon driver for Raspberry Pi PoE(+)HAT fan'
url=https://github.com/raspberrypi/linux/blob/${_commit}/drivers/hwmon/rpi-poe-fan.c
arch=(any)
license=('GPL')
depends=(dkms)
provides=(${_pkgbase}=${pkgver}-${pkgrel})
conflicts=(${_pkgbase})
source=(
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/hwmon/rpi-poe-fan.c
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/include/soc/bcm2835/raspberrypi-firmware.h
    dkms.conf
    Makefile
)
b2sums=(
    '92a4e558f527f155deb17af88ea3cfd03aad8dcac9f6ca7100d49d39627c98f9aeefef721583768719b00a130dc11c2494d6d2453bea419582bb3c7ebe3f0b1d'
    '5d4034b09087ee9f0d9e8408a08b0df9b63524a2cd32710f1ded05bbfbfcc5c7aede0eb11847c041811384d74c338a86b907b8965284f094593d6e42369120f5'
    'a70240cc2424ecade86a37acc57f2d7b55a9cf6fbf65fb1f0033e297bb4c5ebb9fc87da0b65b982f518f5a7437dd3717ca9c9a9d584144c14ca3063e068fd4de'
    'a7c1bfb35e77dc50920bc33ab7bd77bc1acbf832fc28ca4a629ab72eb5d6a6bfe1a862a9fd3e5c1721af339772f83687cd2371ce5c39b7cc507eb815f2f1c3ae'
)

prepare() {
    # Make the driver use local raspberrypi-firmware.h copy with new values, as they are not yet upstreamed
    sed -i -e 's|<soc/bcm2835/raspberrypi-firmware.h>|"raspberrypi-firmware.h"|' rpi-poe-fan.c

    # Fix for linux 5.12+
    sed -i -e 's|thermal_cdev_update|//thermal_cdev_update|' rpi-poe-fan.c
}

package() {
    install -Dm 644 Makefile rpi-poe-fan.c raspberrypi-firmware.h dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
