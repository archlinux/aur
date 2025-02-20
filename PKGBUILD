# Maintainer: taotieren <admin@taotieren.com>

pkgname=artery-isp-console-bin
pkgver=3.0.14
pkgrel=1
# epoch=1
pkgdesc="Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/index.jsp"
license=('LicenseRef-Commercial')
provides=(${pkgname%-bin} Artery_ISP_Console)
conflicts=(${pkgname%-bin})
replaces=()
depends=(
    bash
    qt5-base
    gcc-libs
    glibc
    libusb
)
makedepends=('unzip')
backup=()
options=('!strip' '!debug' '!lto')
install=${pkgname}.install
_pkg_file_name=Artery_ISP_Console_Linux-${arch}_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Artery_ISP_Console_Linux-${arch}_V${pkgver}.zip"
    ${pkgname}.install)
sha256sums=('bb9d35f90a7915c8646a8e3b3984643b15095d7b6a8a31ce87c0f13648436136'
            'a5c4d923298e09eef75b9481ea4fd83998d01c1d3605f118edd42f89ee17e619')
noextract=()

package() {
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${srcdir}"

    cd "${srcdir}/"
    install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/" \
        "${pkgdir}/usr/lib/"

    cp -rv Document "${pkgdir}/opt/artery32/${pkgname%-bin}/Document"
    cp -rv *.pdf "${pkgdir}/opt/artery32/${pkgname%-bin}/Document"

    cd ${_pkg_file_name%.zip}
    cp -rv Map "${pkgdir}/opt/artery32/${pkgname%-bin}/Map"
    install -Dm0755 AT32_ISP_Console "${pkgdir}/opt/artery32/${pkgname%-bin}/AT32_ISP_Console"
    install -dm0755 "${pkgdir}/usr/lib"
    cp -rv {libAT*.so*,libFiles.so*} "${pkgdir}/usr/lib"
    #     install -Dm0644 AT32_ISP_Console.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/AT32_ISP_Console.sh.template"
    install -Dm0644 DFU_download.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/DFU_download.sh.template"
    install -Dm0644 I2C_download.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/I2C_download.sh.template"
    install -Dm0644 SPI_download.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/SPI_download.sh.template"
    install -Dm0644 USART_download.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/USART_download.sh.template"

    cd "${pkgdir}/usr/lib/"
    for lib in lib*; do
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.0.0}"
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.1.0.0}"
    done

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/49-artery32-udev.rules" <<EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "udevadm control --reload"

ACTION!="add|change", GOTO="artery32_udev_rules_end"

SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="artery32_udev_rules_end"

# Artery tek
ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="f000", MODE="660", TAG+="uaccess"
ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="660",  TAG+="uaccess"

# If you share your linux system with other users, or just don't like the
# idea of write permission for everybody, you can replace MODE:="0666" with
# OWNER:="yourusername" to create the device owned by you, or with
# GROUP:="somegroupname" and mange access using standard unix groups.

LABEL="artery32_udev_rules_end"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/AT32_ISP_Console "\$@"
EOF
    chown -R root:root "${pkgdir}/"
}
