# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>
# Contributor: Tyler Veness <calcmogul at gmail dot com>

pkgname=xilinx-usb-drivers
pkgver=14.7
pkgrel=3
pkgdesc="Platform Cable USB and Digilent USB-JTAG support for Xilinx (iMPACT)"
url="https://www.xilinx.com/products/design-tools/ise-design-suite.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('xilinx-ise=14.7' 'fxload' 'libusb-compat')
optdepends=('digilent.adept.utilities: Digilent programmer support')

_ise=/opt/Xilinx/14.7/ISE_DS/ISE
if [[ $CARCH == 'i686' ]]; then
    _arch=lin
elif [[ $CARCH == 'x86_64' ]]; then
    _arch=lin64
fi

package() {
    # Install udev rules
    mkdir -p ${pkgdir}/usr/lib/udev/rules.d
    sed -e 's/TEMPNODE/tempnode/' \
        -e 's/SYSFS/ATTRS/g' \
        -e 's/BUS/SUBSYSTEMS/' \
        -e 's/sbin/usr\/bin/' \
        -e 's!/usr/share!'${_ise}'/bin/'${_arch}'!' \
        ${_ise}/bin/${_arch}/xusbdfwu.rules > ${pkgdir}/usr/lib/udev/rules.d/60-xusbdfwu.rules

    # iMPACT expects firmware files in /usr/share before connecting
    mkdir -p ${pkgdir}/usr/share
    for fw in ${_ise}/bin/${_arch}/xusb*.hex; do
        ln -s "${fw}" ${pkgdir}/usr/share/
    done

    # Install Digilent plugin
    # See https://wiki.archlinux.org/index.php/Xilinx_ISE_WebPACK#Digilent_USB-JTAG_Drivers
    mkdir -p ${pkgdir}${_ise}/lib/${_arch}/plugins/Digilent/libCseDigilent
    cd ${_ise}/bin/${_arch}/digilent/libCseDigilent_2.4.4-${CARCH}/${_arch}/14.1/libCseDigilent
    install -m644 libCseDigilent.{so,xml} ${pkgdir}${_ise}/lib/${_arch}/plugins/Digilent/libCseDigilent
}
