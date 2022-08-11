# Maintainer: Gabriel Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=peak-lin-driver-dkms
pkgver=1.0.0
pkgrel=9
pkgdesc="Linux driver for PEAK LIN adapter"
arch=('any')
url="https://forum.peak-system.com/viewtopic.php?t=5875"
license=('LGPL2.1' 'GPL2')
depends=('linux>=2.6.38' 'linux-headers' 'dkms')
provides=('peak-linux-driver')
conflicts=('peak-linux-driver')
source=(
    'https://www.peak-system.com/cupd2/plin_linux.zip'
    'Makefile'
    'Kbuild'
    'dkms.conf'
)
md5sums=(
    '237fdbf4dcbfe5d1a1edb1460e4be58e'
    '344c9454481b30d84961c84220a82e25'
    '129c220ddfe26423eb9a2e62aa680e96'
    '277701af599a4b480eb9e079cc805063'
)

prepare() {
    cd "${srcdir}/"

    tar -xvf "peak-lin-driver-${pkgver}-rc${pkgrel}.tar.gz"
}

package()  {
    cd "${srcdir}/peak-lin-driver-${pkgver}-rc${pkgrel}/driver"

    # fix for latest kernels
    sed -i '1s/^/#define MODULE_SUPPORTED_DEVICE(...)\n\n/' plin_usb.c

    # move source files into /usr/src
    install -d "${pkgdir}/usr/src/peak-lin-${pkgver}-rc${pkgrel}/"
    cp -r "." "${pkgdir}/usr/src/peak-lin-${pkgver}-rc${pkgrel}/"

    # move custom build configuration
    cp "${srcdir}/Kbuild" "${pkgdir}/usr/src/peak-lin-${pkgver}-rc${pkgrel}/"
    cp "${srcdir}/Makefile" "${pkgdir}/usr/src/peak-lin-${pkgver}-rc${pkgrel}/"

    # install system header
    install -d "${pkgdir}/usr/include/"
    install -Dm644 "plin.h" "${pkgdir}/usr/include/"

    # copy dkms.conf
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/peak-lin-${pkgver}-rc${pkgrel}/"
}
