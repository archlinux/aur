# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mounriverstudio-bin
pkgname=(${pkgbase})
pkgdesc="MounRiver Studio Ⅱ(MRS2)为MounRiver Studio的换代版本，从V2.1.0开始，框架更换至更现代的VSCode，并深度定制开发。在工程管理、代码编辑、编译、调试等方面均兼容之前版本，并在效率和功能等方面进行提升，着力将MRS打造为更加轻量化、智能化、高效化的RISC-V IDE。同时，提供Windows/Linux/macOS 以及国产操作系统版本"
pkgver=210
pkgrel=7
arch=('x86_64')
url='http://www.mounriver.com/'
license=('LicenseRef-commercial')
provides=('MounRiverStudio-Linux' ${pkgname%-bin})
conflicts=(${pkgname%-bin})
depends=(
    alsa-lib
    at-spi2-core
    bash
    cairo
    dbus
    expat
    gcc-libs
    glib2
    glibc
    gtk3
    hidapi
    libcups
    libdrm
    libjaylink
    libsecret
    libusb
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxkbfile
    libxrandr
    libudev.so
    nspr
    nss
    mesa
    pango
    python
    python-pygments
    # AUR
    #     ncurses5-compat-libs
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
source=("${pkgbase}-${pkgver}.deb::http://file-oss.mounriver.com/upgrade/MounRiverStudio_Linux_X64_V${pkgver}.deb")
sha256sums=('83745c730b3646dc9a5207dbc90e852fb662de9162a45d01cce0f8d90e37ec94')
options=('!strip' '!debug')
# noextract=(${pkgbase}-${pkgver}.deb)

package() {
    tar -xf "${srcdir}//data.tar.xz" -C "${pkgdir}/"
    find "${pkgdir}/" -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/MRS2 -perm 600 -exec chmod 644 {} \;

    cd ${pkgdir}/usr/share/
    sed -i 's|/usr/share/MRS2/MRS-linux-x64/mounriver-studio\\ 2|mounriverstudio|g' applications/MounRiverStudio2.desktop
    cd MRS2
    sed -i 's|plugdev|uucp|g' beforeinstall/50-wch.rules
    sed -i 's|plugdev|uucp|g' beforeinstall/60-openocd.rules
    install -Dm0644 "beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-mrs2.rules"
    install -Dm0644 "beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-mrs2.rules"
    rm -rf beforeinstall

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-mrs2-arm" <<EOF
#!/bin/env bash
exec /usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/OpenOCD/OpenOCD/bin/openocd -f /usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/OpenOCD/OpenOCD/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-mrs2-riscv" <<EOF
#!/bin/env bash
exec /usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/OpenOCD/OpenOCD/bin/openocd -f /usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/OpenOCD/OpenOCD/bin/wch-riscv.cfg "\$@"

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d '/usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/Toolchain/RISC-V Embedded GCC12/bin/' ] && append_path '/usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/Toolchain/RISC-V Embedded GCC12/bin/'

[ -d '/usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/Toolchain/RISC-V Embedded GCC/bin/' ] && append_path '/usr/share/MRS2/MRS-linux-x64/resources/app/resources/linux/components/WCH/Toolchain/RISC-V Embedded GCC/bin/'

export PATH
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/sh
/usr/share/MRS2/MRS-linux-x64/mounriver-studio\ 2 "\$@"
EOF
}

# vim: ts=4 sw=4 et
