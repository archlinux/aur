# Maintainer: taotieren <admin@taotieren.com>

pkgname=artery-isp-console-bin
pkgver=3.0.06
pkgrel=0
# epoch=1
pkgdesc="Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。"
arch=('x86_64')
url="https://www.arterytek.com/cn/product/AT32F403.jsp"
license=('Commercial')
provides=(Artery_ISP_Console)
conflicts=()
replaces=()
depends=('icu' 'qt5-base' 'gcc-libs' 'glibc' 'systemd-libs' 'zlib' 'double-conversion' 'pcre2' 'zstd' 'glib2' 'xz' 'lz4' 'libcap' 'libgcrypt' 'libgpg-error')
makedepends=('unzip')
backup=()
options=('!strip')
install=${pkgname}.install
_pkg_file_name=Artery_ISP_Console_Linux-${arch}_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Artery_ISP_Console_Linux-${arch}_V${pkgver}.zip")
sha256sums=('1b75e4a284572b1b3c7f5aed0f93b987eed3b42d5c21f42771c75489905686bf')
noextract=()

package() {
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${srcdir}"

    cd "${srcdir}/"
    install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/" \
                    "${pkgdir}/usr/lib/"

    cp -rv Document  "${pkgdir}/opt/artery32/${pkgname%-bin}/Document"

    cd ${_pkg_file_name%.zip}
    cp -rv Map  "${pkgdir}/opt/artery32/${pkgname%-bin}/Map"
    install -Dm0755 AT32_ISP_Console  "${pkgdir}/opt/artery32/${pkgname%-bin}/AT32_ISP_Console"
    install -Dm0644 libATBLLIB.so.1.0.0  "${pkgdir}/usr/lib/libATBLLIB.so.1.0.0"
    install -Dm0644 libATDFULIB.so.1.0.0  "${pkgdir}/usr/lib/libATDFULIB.so.1.0.0"
    install -Dm0644 libATUARTBLLIB.so.1.0.0  "${pkgdir}/usr/lib/libATUARTBLLIB.so.1.0.0"
    install -Dm0644 libFiles.so.1.0.0  "${pkgdir}/usr/lib/libFiles.so.1.0.0"
    install -Dm0644 AT32_ISP_Console.sh  "${pkgdir}/opt/artery32/${pkgname%-bin}/AT32_ISP_Console.sh.template"
    install -Dm0644 DFU_download.sh  "${pkgdir}/opt/artery32/${pkgname%-bin}/DFU_download.sh.template"
    install -Dm0644 USART_download.sh  "${pkgdir}/opt/artery32/${pkgname%-bin}/USART_download.sh.template"

    cd "${pkgdir}/usr/lib/"
    for lib in lib*; do
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.0.0}"
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.1.0.0}"
    done

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/49-artery32-udev.rules" << EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "udevadm control --reload"

ACTION!="add|change", GOTO="artery32_udev_rules_end"

SUBSYSTEM=="gpio", MODE="0660", GROUP="plugdev", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="artery32_udev_rules_end"

# Artery tek
ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="f000", MODE="660", GROUP="plugdev", TAG+="uaccess"
ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="660", GROUP="plugdev", TAG+="uaccess"

# If you share your linux system with other users, or just don't like the
# idea of write permission for everybody, you can replace MODE:="0666" with
# OWNER:="yourusername" to create the device owned by you, or with
# GROUP:="somegroupname" and mange access using standard unix groups.

LABEL="artery32_udev_rules_end"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/AT32_ISP_Console "\$@"
EOF

}
