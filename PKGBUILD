# Maintainer: mox <mox at uni-hd de>
# Based on libftd2xx maintained by Chris <alostengineer at narmos org> et al.
pkgname=libftd3xx
pkgver=1.1.0
pkgrel=1
pkgdesc="Library that allows a direct access to a FTDI USB3.0 chip (FT60x) based device. Proprietary FTDI drivers BETA."
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('custom')
depends=('glibc' 'libusb>=1.0.8')

# Keep static lib
options=(!strip staticlibs)

# Separate packages for each architecture
if [ "${CARCH}" == "i686" ]; then
    source=(https://ftdichip.com/wp-content/uploads/2025/11/libftd3xx-linux-x86_32-${pkgver}.tgz
            LICENSE.html::https://ftdichip.com/driver-licence-terms/)
    md5sums=('d4f82a146f1416e83c4c4e7214b03631'
             'f561247e19b5b704f60b65741cffbcd7')
else
    source=(https://ftdichip.com/wp-content/uploads/2025/11/libftd3xx-linux-x86_64-${pkgver}.tgz
            LICENSE.html::https://ftdichip.com/driver-licence-terms/)
    md5sums=('d98bc867aabf4f0368c619d19d3e5740'
             'f561247e19b5b704f60b65741cffbcd7')
fi

prepare() {
    echo "Extracting the inner package"
    tar xf libftd3xx-linux-${CARCH}-${pkgver}.tgz
}

package() {
    # Make required dirs
    mkdir -p ${pkgdir}/usr/{lib,include}
    mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
    mkdir -p ${pkgdir}/usr/include/libftd3xx/
    mkdir -p ${pkgdir}/etc/udev/rules.d

    # Install versioned so file as well as static library
    install -Dm755 ${srcdir}/linux-${CARCH}/${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so.${pkgver}
    install -m644 ${srcdir}/linux-${CARCH}/${pkgname}-static.a ${pkgdir}/usr/lib/${pkgname}.a

    # Link versioned so file to generic
    ln -sf /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so

    # Install Headers
    install -m644 "${srcdir}"/linux-${CARCH}/ftd3xx.h "${pkgdir}"/usr/include/libftd3xx/
    install -m644 "${srcdir}"/linux-${CARCH}/Types.h "${pkgdir}"/usr/include/libftd3xx/

    # Install udev rules
    install -D -m755 "${srcdir}"/linux-${CARCH}/51-ftd3xx.rules "${pkgdir}"/etc/udev/rules.d/51-ftd3xx.rules

    # Install the license
    install -Dm644 "${srcdir}"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
}


