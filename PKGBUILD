# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mounriver-studio-community-bin
pkgname=(${pkgbase})
pkgver=190
pkgrel=4
arch=('x86_64')
url='http://www.mounriver.com/'
license=('LicenseRef-custom')
provides=('MounRiver-Studio-Community-Linux' ${pkgname%-bin})
conflicts=(${pkgname%-bin})
depends=(
    #     gcc-libs
    #     glib2
    #     glibc
    #     libsecret
    #     java-runtime
    #     perl
    #     python
    #     zlib
)
makedepends=('tar')
optdepends=('ch34x-dkms-git: CH341SER driver with fixed bug'
    'i2c-ch341-dkms: CH341 USB-I2C adapter driver'
    'spi-ch341-usb-dkms: SPI/GPIO driver for CH341'
    'ch341eepromtool: An i2c serial EEPROM programming tool for the WCH CH341A'
    'ch341prog-git: A simple command line tool (programmer) interfacing with ch341a'
    'ch341eeprom-git: A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A'
    'ch343ser-dkms: USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc (dkms).'
    'wchisp: WCH ISP Tool in Rust')
source=("${pkgbase}-${pkgver}.tar.xz::http://file-oss.mounriver.com/upgrade/MounRiver_Studio_Community_Linux_x64_V${pkgver}.tar.xz")
sha256sums=('11e686fe7d00a861ee8ce9f51e01ba432e73d38e3498bc9d6a27b16af7c70b57')
options=('!strip')
noextract=(${pkgbase}-${pkgver}.tar.xz)

export LC_CTYPE="zh_CN.UTF-8"

prepare() {
    tar -xf "${srcdir}/${pkgbase}-${pkgver}.tar.xz" --strip-components=1 -C "${srcdir}/"
    find MRS_Community -perm 600 -exec chmod 644 {} \;
}

package_mounriver-studio-community-bin() {
    pkgdesc="为 Eclipse 平台爱好者提供的一款 RISC-V 内核芯片集成开发环境，支持 WCH 系列 MCU 的工程模板、代码编译、下载、调试等功能。 "
    depends=('bash'
        'libftdi-compat'
        'libusb'
        'hidapi'
        'libusb-compat'
        'libudev.so'
        gcc-libs
        glib2
        glibc
        libsecret
        java-runtime
        perl
        python
        zlib)
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}/"
    cp -a "${srcdir}"/MRS_Community/* "${pkgdir}/opt/wch/${pkgname%-bin}"
    sed -i 's|plugdev|uucp|g' ${srcdir}/beforeinstall/50-wch.rules
    sed -i 's|plugdev|uucp|g' ${srcdir}/beforeinstall/60-openocd.rules
    install -Dm0644 "${srcdir}/beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-wch-community.rules"
    install -Dm0644 "${srcdir}/beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-wch-community.rules"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-arm" <<EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/openocd -f /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-community-riscv" <<EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin/openocd -f /opt/wch/${pkgname%-bin}/toolchain/OpenOCD/bin//wch-riscv.cfg "\$@"

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
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
