# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mounriver-studio-toolchain-bin
pkgname=($pkgbase mounriver-studio-toolchain-openocd-bin mounriver-studio-toolchain-riscv-bin)
pkgver=1.10
pkgrel=1
arch=('x86_64')
url='http://www.mounriver.com/'
license=('GPL2' 'GPL3' 'Custom')
provides=('MRS-Toolchain')
conflicts=()
depends=('bash')
makedepends=('tar')
optdepends=('ch34x-dkms-git: CH341SER driver with fixed bug'
            'i2c-ch341-dkms: CH341 USB-I2C adapter driver'
            'spi-ch341-usb-dkms: SPI/GPIO driver for CH341'
            'ch341eepromtool: An i2c serial EEPROM programming tool for the WCH CH341A'
            'ch341prog-git: A simple command line tool (programmer) interfacing with ch341a'
            'ch341eeprom-git: A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A')
source=("${pkgbase}-${pkgver}.tar.gz::http://file.mounriver.com/tools/MRS_Toolchain_Linux_x64_V${pkgver}.tar.gz"
        )

sha256sums=('443a7392c42cd387a2b0445f265e9e98b020b7779d346f360a786f1c0c1a7b9b')

noextract=(${pkgbase}-${pkgver}.tar.gz)

package_mounriver-studio-toolchain-bin() {
    pkgdesc="This MRS Toolchain includes the tool chain for RISC-V kernel chip under Linux x64 and the debug download tool OpenOCD."
    depends=(mounriver-studio-toolchain-openocd-bin mounriver-studio-toolchain-riscv-bin)
}

package_mounriver-studio-toolchain-openocd-bin() {
    pkgdesc="MRS Toolchain OpenOCD supports erasure, programming, verification and debugging of the chip."
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgbase}-${pkgver}.tar.gz" --strip-components=2 -C "${srcdir}"
    cp -r "${srcdir}"/OPENOCD/* "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-arm" << EOF
#!/bin/env bash
cd /opt/wch/${pkgname%-bin}/bin
exec ./openocd -f wch-arm.cfg "\$@"

EOF
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-riscv" << EOF
#!/bin/env bash
cd /opt/wch/${pkgname%-bin}/bin
exec ./openocd -f wch-riscv.cfg "\$@"

EOF
}

package_mounriver-studio-toolchain-riscv-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgbase}-${pkgver}.tar.gz" --strip-components=2 -C "${srcdir}"
    cp -r "${srcdir}"/RISC-V\ Embedded\ GCC/* "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}
# vim: ts=4 sw=4 et
