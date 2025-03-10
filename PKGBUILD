# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wch-bleuart
pkgname=($pkgbase wch-bleuart-app wch-ble-lib wch-bleuart-guide)
pkgver=1.3
pkgrel=1
arch=('x86_64')
url='http://www.mounriver.com/'
license=('GPL-2.0-or-later')
provides=()
conflicts=()
depends=(
    bash
    gcc-libs
    glib2
    glibc
    libgpg-error
    java-runtime
    zlib
)
makedepends=('libarchive' 'unarchiver')
optdepends=('mounriver-studio-toolchain-bin: This MRS Toolchain includes the tool chain for RISC-V kernel chip under Linux x64 and the debug download tool OpenOCD.')
source=(
    "wch-ble-lib-${pkgver}.zip::https://api.wch.cn/api/official/website/common/downloadFile?fileName=BleUartLib.ZIP"
    "wch-bleuart-app-${pkgver}.zip::https://api.wch.cn/api/official/website/common/downloadFile?fileName=BleUartApp.ZIP"
    "CH9143DS1-${pkgver}.pdf::https://api.wch.cn/api/official/website/common/downloadFile?fileName=CH9143DS1.PDF"
    "CH9140DS1-${pkgver}.pdf::https://api.wch.cn/api/official/website/common/downloadFile?fileName=CH9140DS1.PDF"
    "CH9141DS1-${pkgver}.pdf::https://api.wch.cn/api/official/website/common/downloadFile?fileName=CH9141DS1.PDF"

)

sha256sums=('9f9326c81fdf2d1e88e621a628f1c5d64c55d07fd2dab67c5362a3c9b1a3282d'
            '85cd9431265bb728d5f89bb72947b6deb62338689c8be647027b07314dbeed48'
            '7d31eb1b4fede49c7f6786c072a6a4d61329dad797b1ad72e5060ac24f33456b'
            '4013a01ef7a7928e3232b0aed9a4622ad4a9c4ac3481900c6ff895250de690ef'
            '95dac832cb5168d4388192baa16e84baf38672b39420fdd7bcd793c3784a2fd3')

noextract=(wch-bleuart-app-${pkgver}.zip wch-ble-lib-${pkgver}.zip)

package_wch-bleuart() {
    pkgdesc="Wch-bleuart contains all related software packages of BleUart."
    depends=(wch-bleuart-app wch-ble-lib wch-bleuart-guide)
}

package_wch-bleuart-app() {
    pkgdesc="The software is used for the CH914X chip module of CH914X low-power Bluetooth to serial port."

    install -dm0755 "${pkgdir}/opt/wch/${pkgname}"

    unar -e GBK "${srcdir}/${pkgname}-${pkgver}.zip" -o "${srcdir}"
    bsdtar xf "${srcdir}/BleUartApp/Linux/bleuart_1.0_amd64.deb"
    bsdtar xf "${srcdir}/data.tar.xz" --strip-components=3 -C "${pkgdir}/opt/wch/${pkgname}"
    cp -r "${srcdir}"/BleUartApp/*.pdf "${pkgdir}/opt/wch/${pkgname}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/bleuart" <<EOF
#!/bin/env bash

cd /opt/wch/${pkgname}
exec ./BleUart "\$@"

EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/bleuart.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=BleUart
Exec=bleuart
Icon=/opt/wch/${pkgname}/BleUart.ico
Comment=BleUart, V1.0 南京沁恒微电子股份有限公司 版权所有(C) WCH 2021
Terminal=false
Type=Application
Encoding=UTF-8

EOF
}

package_wch-ble-lib() {
    pkgdesc="WCH BleLib Multi-system platform low Power Bluetooth Development Interface Library."
    provides=('CH914X-lib' 'CH57X-lib' 'CH9140-lib' 'CH9141-lib' 'CH9143-lib' 'CH579-lib' 'CH578-lib' 'CH573-lib')
    install -dm0755 "${pkgdir}/opt/wch/${pkgname}"

    unar -e GBK "${srcdir}/${pkgname}-${pkgver}.zip"
    cp -r "${srcdir}"/BleUartLib/* "${pkgdir}/opt/wch/${pkgname}"

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.sh" <<EOF
#!/bin/sh
[ -d /opt/wch/${pkgname}/Linux/LIB ] && append_path '/opt/wch/${pkgname}/Linux/LIB'

export PATH
EOF
}

package_wch-bleuart-guide() {
    pkgdesc="Introduction to CH9140 CH9141 CH9143."
    install -dm0755 "${pkgdir}/opt/wch/${pkgname}"
    provides=('CH914X-guide' 'CH9140-guide' 'CH9141-guide' 'CH9143-guide')
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/wch/${pkgname}"
}
# vim: ts=4 sw=4 et
