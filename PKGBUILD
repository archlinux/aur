# Maintainer: taotieren <admin@taotieren.com>

pkgname=at-link-console-bin
pkgver=3.0.12
pkgrel=1
pkgdesc="Artery AT LINK Console 是一款基于 MCU Bootloader 的命令行应用程序。支持AT32 MCU「在电路编程」Console工具"
arch=('x86_64')
url="https://www.arterytek.com/cn/product/AT32F403.jsp"
license=('LicenseRef-Commercial')
provides=(${pkgname%-bin} AT-LINK_Console)
conflicts=(${pkgname%-bin})
replaces=()
depends=(
    bash
    gcc-libs
    glibc
    libusb
    qt5-base)
makedepends=('unzip')
optdepends=('artery-isp-console-bin: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
    'at32-ide-bin: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。'
    'at32-ide-project-generate: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32 MCU。'
    'at32-work-bench: AT32 MCU 图形化配置软件，生成初始化 C 代码(目前仅支持 AT32F421 系列)'
    'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=('!strip' '!debug' '!lto')
install=${pkgname}.install
_pkg_file_name=Artery_ATLINK_Console_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Artery_ATLINK_Console_Linux-${arch}_V${pkgver}.zip")
sha256sums=('0e50ff99f57eccd309e44b1bf6b25aa2ee7d5072a6fcf8bb40e30f516e7b12db')
noextract=(${_pkg_file_name})

package() {
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${srcdir}"

    cd "${srcdir}"

    install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/" \
        "${pkgdir}/usr/lib/"

    cp -rv Document "${pkgdir}/opt/artery32/${pkgname%-bin}/Document"

    #     cd ${_pkg_file_name%_V${pkgver}.zip}_Linux-${arch}_V${pkgver}/
    # 上游错误，下一版更新需要删除，改用上面的
    cd ${_pkg_file_name%_V${pkgver}.zip}_Linux-${arch}_V${pkgver/10/09}/
    install -Dm0755 ATLink_Console "${pkgdir}/opt/artery32/${pkgname%-bin}/ATLink_Console"
    install -Dm0644 libATLINKLIB.so.1.0.0 "${pkgdir}/usr/lib/libATLINKLIB.so.1.0.0"
    install -Dm0644 ATLink_Console.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/ATLink_Console.sh.template"
    install -Dm0644 download.sh "${pkgdir}/opt/artery32/${pkgname%-bin}/download.sh.template"

    cd "${pkgdir}/usr/lib/"
    for lib in lib*; do
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.0.0}"
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.1.0.0}"
    done

    #     install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/49-artery32-udev.rules" << EOF
    # # Copy this file to /etc/udev/rules.d/
    # # If rules fail to reload automatically, you can refresh udev rules
    # # with the command "udevadm control --reload"
    #
    # ACTION!="add|change", GOTO="artery32_udev_rules_end"
    #
    # SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"
    #
    # SUBSYSTEM!="usb|tty|hidraw", GOTO="artery32_udev_rules_end"
    #
    # # Artery tek
    # ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="f000", MODE="660", TAG+="uaccess"
    # ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="660", TAG+="uaccess"
    #
    # # If you share your linux system with other users, or just don't like the
    # # idea of write permission for everybody, you can replace MODE:="0666" with
    # # OWNER:="yourusername" to create the device owned by you, or with
    # # GROUP:="somegroupname" and mange access using standard unix groups.
    #
    # LABEL="artery32_udev_rules_end"
    # EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/ATLink_Console "\$@"
EOF

}
