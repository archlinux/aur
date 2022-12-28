# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mounriver-studio-toolchain-bin
pkgname=($pkgbase mounriver-studio-toolchain-openocd-bin mounriver-studio-toolchain-riscv-bin)
pkgver=1.60
pkgrel=1
arch=('x86_64')
url='http://www.mounriver.com/'
license=('GPL2' 'GPL3' 'custom')
provides=('MRS-Toolchain')
conflicts=()
depends=()
makedepends=('tar')
optdepends=('ch34x-dkms-git: CH341SER driver with fixed bug'
            'i2c-ch341-dkms: CH341 USB-I2C adapter driver'
            'spi-ch341-usb-dkms: SPI/GPIO driver for CH341'
            'ch341eepromtool: An i2c serial EEPROM programming tool for the WCH CH341A'
            'ch341prog-git: A simple command line tool (programmer) interfacing with ch341a'
            'ch341eeprom-git: A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A'
            'wchisp: WCH ISP Tool in Rust')
source=("${pkgbase}-${pkgver}.tar.xz::http://file.mounriver.com/tools/MRS_Toolchain_Linux_x64_V${pkgver}.tar.xz")
sha256sums=('5a6bfb2bc058d62374f4185eecc98d6f821e59920ecbdecbf59152f678885c57')
options=('!strip')
noextract=(${pkgbase}-${pkgver}.tar.xz)

_install(){
     find ${@: 2} -type f -exec install -Dm$1 {}  ${pkgdir}/opt/wch/${pkgname%-bin}/{} \;
} 

prepare() {
    tar -xf "${srcdir}/${pkgbase}-${pkgver}.tar.xz" --strip-components=1 -C "${srcdir}/"
}

package_mounriver-studio-toolchain-bin() {
    pkgdesc="This MRS Toolchain includes the tool chain for RISC-V kernel chip under Linux x64 and the debug download tool OpenOCD."
    depends=(mounriver-studio-toolchain-openocd-bin mounriver-studio-toolchain-riscv-bin)
}

package_mounriver-studio-toolchain-openocd-bin() {
    depends=('bash'
             'libftdi-compat'
             'libusb'
             'hidapi'
             'libusb-compat'
             'libudev.so')

    pkgdesc="MRS Toolchain OpenOCD supports erasure, programming, verification and debugging of the chip."

    cd "${srcdir}"/OpenOCD/
    _install 644 bin -name "*.cfg"
    _install 755 bin -name "openocd"
    _install 644 share

    install -Dm0644 "${srcdir}/beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-wch.rules"
    install -Dm0644 "${srcdir}/beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-wch.rules"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-arm" << EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/bin/openocd -f /opt/wch/${pkgname%-bin}/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-riscv" << EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/bin/openocd -f /opt/wch/${pkgname%-bin}/bin/wch-riscv.cfg "\$@"

EOF
}

package_mounriver-studio-toolchain-riscv-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    depends=('bash')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"
    cp -a "${srcdir}"/RISC-V\ Embedded\ GCC/* "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}
# vim: ts=4 sw=4 et
