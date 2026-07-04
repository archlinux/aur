# Maintainer: Martino Pilia <martino.pilia@proton.me>
pkgname=openocd-raspberrypi-bin
pkgver=0.12.0
pkgrel=3
pkgdesc="OpenOCD build for Raspberry Pi pico"
arch=("x86_64")
url="https://github.com/raspberrypi/openocd"
license=('GPL2')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'capstone' 'libjaylink' 'libftdi')
provides=(openocd)
conflicts=(openocd)
source=(
    "https://github.com/raspberrypi/pico-sdk-tools/releases/download/v2.2.0-3/openocd-0.12.0+dev-x86_64-lin.tar.gz"
    "https://raw.githubusercontent.com/raspberrypi/openocd/73e9b7898f5518e0cfe7bc2f66d135736558a9fd/contrib/60-openocd.rules"
)
sha256sums=('934c8b1a5d2f85a64e02255bc1da1ce78d5266416a0e845d18dbde251a1ad3ed'
            '0769383c5ef8f277e0b7bf676f0db9943495228574cfdfcd142749fe866733a6')

package() {
    install -D -m755 \
        "${srcdir}/openocd" \
        "${pkgdir}/usr/bin/openocd"

    install -d -m755 \
        "${pkgdir}/etc/udev/rules.d"

    install -D -m644 \
        "${srcdir}/60-openocd.rules" \
        "${pkgdir}/etc/udev/rules.d/60-openocd.rules"

    echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="2e8a", ATTR{idProduct}=="000c", TAG+="uaccess"' \
        > "${pkgdir}/etc/udev/rules.d/60-rp2350-cmsis-dap.rules"

    install -d -m755 \
        "${pkgdir}/usr/share/openocd"

    cp -a \
        "${srcdir}/scripts" \
        "${pkgdir}/usr/share/openocd/scripts"
}

