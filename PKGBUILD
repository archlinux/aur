# Maintainer: taotieren <admin@taotieren.com>
# Contributor: t3u <t3u@t3u.uk>

pkgbase=mounriverstudio-bin
pkgname=(${pkgbase})
pkgdesc="MounRiver Studio Linux 平台全功能版本，内置芯片工程模板，集成工程新建、代码编辑、编译、调试、下载模块以及嵌入式开发辅助工具"
pkgver=300
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
    bzip2
    cairo
    dbus
    expat
    glib2
    gmp
    gtk3
    hidapi
    libcups
    libdrm
    libgcc
    libjaylink
    libsecret
    libstdc++
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
    java-runtime
    ncurses
    mpfr
    nspr
    nss
    mesa
    pango
    perl
    python
    python-pygments
    xz
    zlib
)
makedepends=('tar' 'jq' 'curl')
optdepends=(
    'ch34x-dkms-git: CH341SER driver with fixed bug'
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

# empty dummy file hosted on IPFS to satisfy updpkgsums/lilac checks
# the content hash is guaranteed to be immutable
# the real source file is downloaded dynamically in prepare() due to short-lived URL signatures
source=('https://ipfs.io/ipfs/QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH')
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
options=('!strip' '!debug')

# automatic version detection & download via MounRiver API
prepare() {
    msg "Querying MounRiver API for the latest Linux version..."
    local _info_json=$(curl -s "https://api.mounriver.com/mountriver/api/version/fetchRecent2?swType=2&osType=LINUX&lang=en")

    local _soft_id=$(echo "${_info_json}" | jq -r '.result[0].upgradeRelationBoList[] | select(.softFileType == 2) | .softReId')
    local _filename=$(echo "${_info_json}" | jq -r '.result[0].upgradeRelationBoList[] | select(.softFileType == 2) | .softFileName')
    local _api_version=$(echo "${_info_json}" | jq -r '.result[0].version')

    if [[ "${_soft_id}" == "null" || -z "${_soft_id}" ]]; then
        error "Failed to retrieve software ID from API."
        return 1
    fi

    msg "Found Version: ${_api_version} (File: ${_filename}, ID: ${_soft_id})"

    msg "Fetching dynamic download link..."
    local _dl_json=$(curl -s "https://api.mounriver.com/mountriver/api/version/getDownloadUrl?resourceId=${_soft_id}")
    local _dl_url=$(echo "${_dl_json}" | jq -r '.data // .result')

    if [[ "${_dl_url}" == "null" || -z "${_dl_url}" || "${_dl_url}" != http* ]]; then
        error "Failed to retrieve valid download URL."
        return 1
    fi

    if [ ! -f "${_filename}" ]; then
        msg "Downloading ${_filename}..."
        curl -L -o "${_filename}" "${_dl_url}"
    else
        msg "File ${_filename} already exists, skipping download."
    fi

    # The upstream artifact is a Debian package; unpack its payload.
    msg "Extracting ${_filename}..."
    case "${_filename}" in
        *.deb)
            ar x "${_filename}"
            tar -xf data.tar.*
            rm -f debian-binary control.tar.* data.tar.*
            ;;
        *)
            tar -xf "${_filename}"
            ;;
    esac
}

package() {
    cd "${srcdir}"
    mv  usr ${pkgdir}/

    msg "Fixing permissions..."
    find "${pkgdir}/usr/share/" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/" -perm 600 -exec chmod 644 {} \;

    cd "${pkgdir}/usr/share/MRS3"
    if [ -d "beforeinstall" ]; then
        msg "Installing udev rules..."
        sed -i 's|plugdev|uucp|g' beforeinstall/50-wch.rules
        sed -i 's|plugdev|uucp|g' beforeinstall/60-openocd.rules
        install -Dm0644 "beforeinstall/50-wch.rules" "${pkgdir}/usr/lib/udev/rules.d/50-mrs3.rules"
        install -Dm0644 "beforeinstall/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-openocd-mrs3.rules"

        install -Dm0755 "beforeinstall/load.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

        msg "Cleaning up beforeinstall directory..."
        rm -rf "beforeinstall"
    fi

    local _res_path="MRS-linux-x64/resources/app/resources/linux/components/WCH/Others/CommunicationLib/default"
    if [ -d "${_res_path}" ]; then
        sed -i 's|plugdev|uucp|g' ${_res_path}/50-wch.rules
        sed -i 's|plugdev|uucp|g' ${_res_path}/60-openocd.rules
    fi

    msg "Install mounriver-studio completions to bash zsh..."
    local _icon_src="MRS-linux-x64/resources/resources/completions"
    if [ -f "${_icon_src}" ]; then
        install -Dm644 "${_icon_src}/bash/mounriver-studio 3" -t "${pkgdir}/usr/share/bash-completion/completions/"
        install -Dm644 "${_icon_src}/zsh/_mounriver-studio 3" -t "${pkgdir}/usr/share/zsh/site-functions/"
    fi

    local _tool_path="/usr/share/MRS3/MRS-linux-x64/resources/app/resources/linux/components/WCH"
    msg "Creating OpenOCD wrappers..."
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-mrs3-arm" <<EOF
#!/bin/env bash
exec ${_tool_path}/OpenOCD/OpenOCD/bin/openocd -f ${_tool_path}/OpenOCD/OpenOCD/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-mrs3-riscv" <<EOF
#!/bin/env bash
exec ${_tool_path}/OpenOCD/OpenOCD/bin/openocd -f ${_tool_path}/OpenOCD/OpenOCD/bin/wch-riscv.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-mrs3-dual-core" <<EOF
#!/bin/env bash
exec ${_tool_path}/OpenOCD/OpenOCD/bin/openocd -f ${_tool_path}/OpenOCD/OpenOCD/bin/dual-core.cfg "\$@"

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d '${_tool_path}/Toolchain/arm-none-eabi-gcc/bin/' ] && append_path '${_tool_path}/Toolchain/arm-none-eabi-gcc/bin/'

[ -d '${_tool_path}/Toolchain/RISC-V Embedded GCC15/bin/' ] && append_path '${_tool_path}/Toolchain/RISC-V Embedded GCC15/bin/'

[ -d '${_tool_path}/Toolchain/RISC-V Embedded GCC12/bin/' ] && append_path '${_tool_path}/Toolchain/RISC-V Embedded GCC12/bin/'

[ -d '${_tool_path}/Toolchain/RISC-V Embedded GCC/bin/' ] && append_path '${_tool_path}/Toolchain/RISC-V Embedded GCC/bin/'

export PATH
EOF
}

# vim: ts=4 sw=4 et
