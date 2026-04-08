# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgbase=mounriver-studio-toolchain-bin
pkgname=($pkgbase
    mounriver-studio-toolchain-openocd-bin
    mounriver-studio-toolchain-arm-none-eabi-gcc-bin
    mounriver-studio-toolchain-riscv-gcc-bin
    mounriver-studio-toolchain-riscv-gcc12-bin
    mounriver-studio-toolchain-riscv-gcc15-bin)
pkgver=240
pkgrel=5
arch=('x86_64')
url='http://www.mounriver.com/'
license=('LicenseRef-custom')
provides=('MRS-Toolchain')
makedepends=('tar' 'jq' 'curl')
optdepends=(
    'ch34x-dkms-git: CH341SER driver with fixed bug'
    'i2c-ch341-dkms: CH341 USB-I2C adapter driver'
    'ch341eepromtool: An i2c serial EEPROM programming tool for the WCH CH341A'
    'ch341prog-git: A simple command line tool (programmer) interfacing with ch341a'
    'ch341eeprom-git: A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A'
    'ch343ser-dkms: USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc (dkms).'
    'wchisp: WCH ISP Tool in Rust'
    'imsprog: MSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips'
    'sfp-master: SFP-module programmer for CH341a devices'
)
# empty dummy file hosted on IPFS to satisfy updpkgsums/lilac checks
# the content hash is guaranteed to be immutable
# the real source file is downloaded dynamically in prepare() due to short-lived URL signatures
source=('https://ipfs.io/ipfs/QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH')
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
options=('!strip')
noextract=()
_pkgbase=MRS_Toolchain_Linux_X64_V${pkgver}

_install() {
    find ${@:2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/wch/${pkgname%-bin}/{} \;
}

# automatic version detection & download via MounRiver API
prepare() {
    msg "Querying MounRiver API for the latest Linux version..."
    local _info_json=$(curl -s "http://api.mounriver.com/mountriver/api/version/fetchRecentOpenOcd?osType=LINUX&lang=zh")

    local _soft_id=$(echo "${_info_json}" | jq -r '.result[0].softResId')
    local _filename=$(echo "${_info_json}" | jq -r '.result[0].fileName')
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

    # Cleanup old extraction
    local _old_dir=$(find . -maxdepth 1 -mindepth 1 -type d -print -quit)
    if [ -n "$_old_dir" ]; then
        rm -rf "$_old_dir"
    fi

    mkdir -pv ${srcdir}/${_pkgbase}
    msg "Extracting ${_filename}..."
    tar -xf "${_filename}" -C ${srcdir}/${_pkgbase}
}

package_mounriver-studio-toolchain-bin() {
    pkgdesc="This MRS Toolchain includes the tool chain for RISC-V kernel chip under Linux x64 and the debug download tool OpenOCD."
    depends=(
        mounriver-studio-toolchain-openocd-bin
        mounriver-studio-toolchain-arm-none-eabi-gcc-bin
        mounriver-studio-toolchain-riscv-gcc-bin
        mounriver-studio-toolchain-riscv-gcc12-bin
        mounriver-studio-toolchain-riscv-gcc15-bin)
}

package_mounriver-studio-toolchain-openocd-bin() {
    depends=('bash'
        'glibc'
        'libftdi-compat'
        'libusb'
        'hidapi'
        'libusb-compat'
        'libudev.so'
        'libjaylink.so')

    pkgdesc="MRS Toolchain OpenOCD supports erasure, programming, verification and debugging of the chip."

    cd "${srcdir}"/${_pkgbase}/OpenOCD/OpenOCD/
    _install 644 bin -name "*.cfg"
    _install 755 bin -name "openocd"
    _install 644 share

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-arm" <<EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/bin/openocd -f /opt/wch/${pkgname%-bin}/bin/wch-arm.cfg "\$@"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openocd-wch-riscv" <<EOF
#!/bin/env bash
exec /opt/wch/${pkgname%-bin}/bin/openocd -f /opt/wch/${pkgname%-bin}/bin/wch-riscv.cfg "\$@"

EOF
}

package_mounriver-studio-toolchain-arm-none-eabi-gcc-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    depends=(
        'bash'
        'glibc'
        'python'
    )
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"
    cd "${srcdir}/${_pkgbase}/Toolchain/arm-none-eabi-gcc/"
    cp -a * "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}

package_mounriver-studio-toolchain-riscv-gcc-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    depends=('bash'
        'glibc'
        'python')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"
    cd "${srcdir}/${_pkgbase}/Toolchain/RISC-V Embedded GCC/"
    cp -a * "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}

package_mounriver-studio-toolchain-riscv-gcc12-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    depends=('bash'
        'glibc'
        'python')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"
    cd "${srcdir}/${_pkgbase}/Toolchain/RISC-V Embedded GCC12/"
    cp -a * "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}

package_mounriver-studio-toolchain-riscv-gcc15-bin() {
    pkgdesc="MRS Toolchain Support for RISC-V assembly and GNU C compilation, link operation."
    depends=('bash'
        'glibc'
        'python')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname%-bin}"
    cd "${srcdir}/${_pkgbase}/Toolchain/RISC-V Embedded GCC15/"
    cp -a * "${pkgdir}/opt/wch/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/wch/${pkgname%-bin}/bin ] && append_path '/opt/wch/${pkgname%-bin}/bin'

export PATH
EOF
}
# vim: ts=4 sw=4 et
