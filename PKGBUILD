# Maintainer: taotieren <admin@taotieren.com>
# Contributor: t3u <t3u@t3u.uk>

pkgbase=mounriverstudio-bin
pkgname=(${pkgbase})
pkgdesc="MounRiver Studio Ⅱ(MRS2)为MounRiver Studio的换代版本，从V2.1.0开始，框架更换至更现代的VSCode，并深度定制开发。在工程管理、代码编辑、编译、调试等方面均兼容之前版本，并在效率和功能等方面进行提升，着力将MRS打造为更加轻量化、智能化、高效化的RISC-V IDE。同时，提供Windows/Linux/macOS 以及国产操作系统版本"
pkgver=230
pkgrel=1
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
    'wchisp: WCH ISP Tool in Rust'
    "ezp-chip-data-editor: QT based editor chip database for EZP2019, EZP2019+, EZP2020, EZP2023, EZP2025, MinPro programmer devices"
    "imsprog: MSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips"
    "sfp-master: SFP-module programmer for CH341a devices"
)

_sign="?sign=b1db62a01a9445d6406bbf9b554d03fe&time=19b15b6e1b3&from=120.239.78.250&resId=1987837779154911233"
source=("${pkgname}-${pkgver}.tar.xz::https://file-oss.mounriver.com/upgrade/MounRiverStudio_Linux_X64_V230.tar.xz${_sign}")
sha256sums=('a0b849c052fce7a4f92a317a8251ddf43bf6b492941b300dade5b5fda27d2b89')

options=('!strip' '!debug')

package() {
    cd "${srcdir}/"

    local _extracted_dir=$(find . -maxdepth 1 -mindepth 1 -type d -print -quit)
    if [[ -z "${_extracted_dir}" ]]; then
        error "Extracted directory not found!"
        return 1
    fi

    msg "Installing from: ${_extracted_dir}"

    mkdir -p "${pkgdir}/usr/share"
    cp -r "${_extracted_dir}" "${pkgdir}/usr/share/MRS2"

    msg "Fixing permissions..."
    find "${pkgdir}/usr/share/MRS2" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/MRS2" -perm 600 -exec chmod 644 {} \;

    cd "${pkgdir}/usr/share/MRS2"
    if [ -d "beforeinstall" ]; then
        msg "Installing udev rules..."
        sed -i 's|plugdev|uucp|g' beforeinstall/50-wch.rules
        sed -i 's|plugdev|uucp|g' beforeinstall/60-openocd.rules
        install -Dm0644 "beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-mrs2.rules"
        install -Dm0644 "beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-mrs2.rules"

        install -Dm0755 "beforeinstall/load.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    fi

    local _res_path="MRS-linux-x64/resources/app/resources/linux/components/WCH/Others/CommunicationLib/default"
    if [ -d "${_res_path}" ]; then
        sed -i 's|plugdev|uucp|g' ${_res_path}/50-wch.rules
        sed -i 's|plugdev|uucp|g' ${_res_path}/60-openocd.rules
    fi

    msg "Generating Desktop Entry..."
    local _icon_src="MRS-linux-x64/resources/app/resources/linux/code.png"
    if [ -f "${_icon_src}" ]; then
        install -Dm644 "${_icon_src}" "${pkgdir}/usr/share/pixmaps/MounRiverStudio2.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mounriverstudio.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=MounRiver Studio Ⅱ
Exec=bash "/usr/share/MRS2/beforeinstall/load.sh" %F
Icon=MounRiverStudio2
MimeType=application/x-mrs-project;
Comment=MounRiver Stduio Ⅱ is a free integrated development environment for embedded MCU.
Categories=TextEditor;Development;IDE;
EOF

    msg "Creating OpenOCD wrappers..."
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
}

# vim: ts=4 sw=4 et
