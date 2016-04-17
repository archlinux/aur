# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=xilinx-usb-drivers
pkgver=14.7
pkgrel=1
pkgdesc="libusb/ppdev-connector for Xilinx JTAG tools (like iMPACT)"
arch=('i686' 'x86_64')
license=('custom')
depends=('xilinx-ise')
makedepends=('git')
options=('!strip')
source=("git+git://git.zerfleddert.de/usb-driver")
md5sums=('SKIP')

if [[ $CARCH == 'i686' ]]; then
    _arch=lin
elif [[ $CARCH == 'x86_64' ]]; then
    _arch=lin64
fi

build() {
    cd ${srcdir}/usb-driver
    if [[ $CARCH == 'i686' ]]; then
        make lib32
    elif [[ $CARCH == 'x86_64' ]]; then
        make
    fi
}

package() {
    cd ${srcdir}/usb-driver

    mkdir -p ${pkgdir}/usr/share
    mkdir -p ${pkgdir}/etc/udev/rules.d

    echo "Copying firmware to /usr/share"
    for fw in "${XILINX}/bin/$_arch/"xusb*.hex; do
        cp -v "${fw}" "${pkgdir}/usr/share/"
    done

    echo "Installing udev rules"
    sed -e 's/TEMPNODE/tempnode/' -e 's/SYSFS/ATTRS/g' -e 's/BUS/SUBSYSTEMS/' ${XILINX}/bin/$_arch/xusbdfwu.rules >${pkgdir}/etc/udev/rules.d/xusbdfwu.rules
}
