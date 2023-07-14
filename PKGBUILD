# Maintainer: Chance Chen <ufbycd@163.com>

pkgname=mounriver-studio-community
pkgver=1.50
pkgrel=1
arch=('x86_64')
pkgdesc="为 Eclipse 平台爱好者提供的一款 RISC-V 内核芯片集成开发环境，支持 WCH 系列 MCU 的工程模板、代码编译、下载、调试等功能。 "
url='www.mounriver.com'
license=('GPL2' 'GPL3' 'custom')
provides=()
conflicts=()
depends=('libftdi-compat' 'libusb' 'hidapi' 'libusb-compat' 'udev')
makedepends=()
optdepends=('ch34x-dkms-git: CH341SER driver with fixed bug'
            'i2c-ch341-dkms: CH341 USB-I2C adapter driver'
            'spi-ch341-usb-dkms: SPI/GPIO driver for CH341'
            'ch341eepromtool: An i2c serial EEPROM programming tool for the WCH CH341A'
            'ch341prog-git: A simple command line tool (programmer) interfacing with ch341a'
            'ch341eeprom-git: A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.xz::http://file.mounriver.com/upgrade/MounRiver_Studio_Community_Linux_x64_V${pkgver//./}.tar.xz"
        "udev-rules.patch")
sha256sums=('713b6d5a343ec887ea7b27b3fc0f1acc93ba041b26af27a83e5dc85597e1ae5c'
            '7ed97c1a494ddbd5b6d594223bc35aa31949c416c0b23a3adabfda239b9f3c73')

prepare() {
    cd "$srcdir/MounRiver_Studio_Community_Linux_x64_V${pkgver//./}"
    patch --forward --strip=1 --input="${srcdir}/udev-rules.patch"
    find MRS_Community -perm 600 -exec chmod 644 {} \;
}

package() {
    cd "$srcdir/MounRiver_Studio_Community_Linux_x64_V${pkgver//./}"
    install -dm0755 "$pkgdir/usr/share/$pkgname"
    cp -afr MRS_Community/* "$pkgdir/usr/share/$pkgname"

    install -Dm0644 "beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-wch-community.rules"
    install -Dm0644 "beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-wch-community.rules"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-arm" << EOF
#!/bin/env bash
exec /usr/share/$pkgname/toolchain/OpenOCD/bin/openocd -f /usr/share/$pkgname/toolchain/OpenOCD/bin/wch-arm.cfg "\$@"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-riscv" << EOF
#!/bin/env bash
exec /usr/share/$pkgname/toolchain/OpenOCD/bin/openocd -f /usr/share/$pkgname/toolchain/OpenOCD/bin//wch-riscv.cfg "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.sh" << EOF
[ -d /usr/share/$pkgname/toolchain/arm-none-eabi-gcc/bin/ ] && append_path '/usr/share/$pkgname/toolchain/arm-none-eabi-gcc/bin/'
[ -d /usr/share/$pkgname/toolchain/RISC-V\ Embedded\ GCC/bin/ ] && append_path '/usr/share/$pkgname/toolchain/RISC-V\ Embedded GCC/bin/'
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
/usr/share/$pkgname/MounRiver\ Studio_Community "\$@"
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=MounRiver Studio Community
GenericName=MounRiver Studio Community
Comment=Eclipse Based Embedded C/C++ IDE for WCH Microcontroller
Exec=/usr/bin/$pkgname
Icon=/usr/share/$pkgname/icon.xpm
Path=/usr/share/$pkgname/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development;RISC-V;ARM;
EOF
}

# vim: ts=4 sw=4 et
