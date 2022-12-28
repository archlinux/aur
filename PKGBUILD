# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mounriver-studio-community-bin
pkgname=($pkgbase)
pkgver=130
pkgrel=1
arch=('x86_64')
url='http://www.mounriver.com/'
license=('GPL2' 'GPL3' 'custom')
provides=('MounRiver-Studio-Community-Linux')
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

source=("${pkgbase}-${pkgver}.tar.xz::http://file.mounriver.com/upgrade/MounRiver_Studio_Community_Linux_x64_V${pkgver}.tar.xz"
        )

sha256sums=('dd692f617b1c67a66d27a85d3e19e65668e8f462df7a732d6cd40803d663c762')

options=('!strip')

noextract=(${pkgbase}-${pkgver}.tar.xz)

prepare() {
    tar -xf "${srcdir}/${pkgbase}-${pkgver}.tar.xz" --strip-components=1 -C "${srcdir}/"
}

package_mounriver-studio-community-bin() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="为 Eclipse 平台爱好者提供的一款 RISC-V 内核芯片集成开发环境，支持 WCH 系列 MCU 的工程模板、代码编译、下载、调试等功能。 "
    depends=('bash'
             'libftdi-compat'
             'libusb'
             'hidapi'
             'libusb-compat'
             'libudev.so')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}/"
    cp -a "${srcdir}"/MRS_Community/* "${pkgdir}/opt/wch/${pkgname%-bin}"
    install -Dm0644 "${srcdir}/beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-wch-community.rules"
    install -Dm0644 "${srcdir}/beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-wch-community.rules"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-arm" << EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/openocd -f /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-riscv" << EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/openocd -f /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin//wch-riscv.cfg "\$@"

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/toolchain/arm-none-eabi-gcc/bin/ ] && append_path '/opt/wch/${pkgname%-bin}/toolchain/arm-none-eabi-gcc/bin/'
[ -d /opt/wch/${pkgname%-bin}/toolchain/RISC-V\ Embedded\ GCC/bin/ ] && append_path '/opt/wch/${pkgname%-bin}/toolchain/RISC-V\ Embedded GCC/bin/'

export PATH
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/sh
/opt/wch/${pkgname%-bin}/MounRiver\ Studio_Community "\$@"
EOF

    install -Dm0644 "${pkgdir}/opt/wch/${pkgname%-bin}/icon.xpm" "${pkgdir}/usr/share/icons/${pkgname%-bin}.xpm"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop" <<EOF
[Desktop Entry]
Name=MounRiver Studio Community
Comment=MounRiver Studio Community
GenericName=MounRiver Studio Community
Exec=env GDK_BACKEND=x11 ${pkgname%-bin} %F
Icon=${pkgname%-bin}.xpm
Path=/opt/wch/${pkgname%-bin}/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development;RISC-V;ARM;
EOF
}

# vim: ts=4 sw=4 et
