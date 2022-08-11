# Maintainer: taotieren <admin@taotieren.com>

pkgname=artery-isp-console-bin
pkgver=3.0.01
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
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
_pkg_file_name=Artery_ISP_Console_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Artery_ISP_Console_V3.0.01.zip")
sha256sums=('0d1257d98acc4b77a6545a938d84c794553c848d446f7199aa77c48ae910a57e')
noextract=()

build() {
   unar -e GBK  ${srcdir}/${_pkg_file_name}
}

package() {
    cd "${srcdir}/${_pkg_file_name%.zip}/"
    install -dm0755 "${pkgdir}/opt/Artery32/${pkgname%-bin}/" \
                    "${pkgdir}/usr/lib/"

    cp -rv Document  "${pkgdir}/opt/Artery32/${pkgname%-bin}/Document"

    cd ${_pkg_file_name%_V${pkgver}.zip}_Linux_V${pkgver}/
    cp -rv Map  "${pkgdir}/opt/Artery32/${pkgname%-bin}/Map"
    install -Dm0755 AT32_ISP_Console  "${pkgdir}/opt/Artery32/${pkgname%-bin}/AT32_ISP_Console"
    install -Dm0644 libATBLLIB.so.1.0.0  "${pkgdir}/usr/lib/libATBLLIB.so.1.0.0"
    install -Dm0644 libATDFULIB.so.1.0.0  "${pkgdir}/usr/lib/libATDFULIB.so.1.0.0"
    install -Dm0644 libATUARTBLLIB.so.1.0.0  "${pkgdir}/usr/lib/libATUARTBLLIB.so.1.0.0"
    install -Dm0644 libFiles.so.1.0.0  "${pkgdir}/usr/lib/libFiles.so.1.0.0"
    install -Dm0644 AT32_ISP_Console.sh  "${pkgdir}/opt/Artery32/${pkgname%-bin}/AT32_ISP_Console.sh.template"
    install -Dm0644 DFU_download.sh  "${pkgdir}/opt/Artery32/${pkgname%-bin}/DFU_download.sh.template"
    install -Dm0644 USART_download.sh  "${pkgdir}/opt/Artery32/${pkgname%-bin}/USART_download.sh.template"

    cd "${pkgdir}/usr/lib/"
    for lib in lib*; do
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.0.0}"
        ln -sf /usr/lib/"$lib" "${pkgdir}/usr/lib/${lib%.1.0.0}"
    done

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/49-artery32-udev.rules" << EOF
# AT32 Bootloader DFU Install Disk
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", \
    KERNEL=="tty*", MODE:="0666", \
    SYMLINK+="AT32-Bootloader-DFU_%n"

# AT-START-F437 V1.0 boards, with onboard AT-Link-EZ V1.2
# ie, AT32F403CGT6, AT32F437ZMT7.
# AT32F403CGT6 has AT-Link-EZ V1.2, which is quite different

# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="f000", \
#    KERNEL=="tty*", MODE:="0666", \
#    SYMLINK+="atlink-vcp_%n"

# If you share your linux system with other users, or just don't like the
# idea of write permission for everybody, you can replace MODE:="0666" with
# OWNER:="yourusername" to create the device owned by you, or with
# GROUP:="somegroupname" and mange access using standard unix groups.
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
/opt/Artery32/${pkgname%-bin}/AT32_ISP_Console "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname%-isp-console-bin}.conf" << EOF
u artery - "Artery ISP Console" /opt/Artery32
m artery uucp
m artery network
m artery tty
EOF
}
