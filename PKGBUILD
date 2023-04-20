# Maintainer: taotieren <admin@taotieren.com>

pkgname=at-link-console-bin
pkgver=3.0.06
pkgrel=0
pkgdesc="Artery AT LINK Console 是一款基于 MCU Bootloader 的命令行应用程序。支持AT32 MCU「在电路编程」Console工具"
arch=('x86_64')
url="https://www.arterytek.com/cn/product/AT32F403.jsp"
license=('Commercial')
provides=(AT-LINK_Console)
conflicts=()
replaces=()
depends=('icu' 'qt5-base' 'gcc-libs' 'glibc' 'systemd-libs' 'zlib' 'double-conversion' 'pcre2' 'zstd' 'glib2' 'xz' 'lz4' 'libcap' 'libgcrypt' 'libgpg-error')
makedepends=('unzip')
backup=()
options=('!strip')
install=${pkgname}.install
_pkg_file_name=Artery_ATLINK_Console_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Artery_ATLINK_Console_Linux-${arch}_V${pkgver}.zip")
sha256sums=('6453d5f52ad1c03e97c40fe3b608e327ffdd81b81dccad3150f9ad99fba0beee')
noextract=(${_pkg_file_name})

package() {
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${srcdir}"

    cd "${srcdir}"

    install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/" \
                    "${pkgdir}/usr/lib/"

    cp -rv Document  "${pkgdir}/opt/artery32/${pkgname%-bin}/Document"

    cd ${_pkg_file_name%_V${pkgver}.zip}_Linux-${arch}_V${pkgver}/
    install -Dm0755 ATLink_Console  "${pkgdir}/opt/artery32/${pkgname%-bin}/ATLink_Console"
    install -Dm0644 libATLINKLIB.so.1.0.0  "${pkgdir}/usr/lib/libATLINKLIB.so.1.0.0"
    install -Dm0644 ATLink_Console.sh  "${pkgdir}/opt/artery32/${pkgname%-bin}/ATLink_Console.sh.template"
    install -Dm0644 download.sh  "${pkgdir}/opt/artery32/${pkgname%-bin}/download.sh.template"

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
# SUBSYSTEM=="gpio", MODE="0660", GROUP="plugdev", TAG+="uaccess"
#
# SUBSYSTEM!="usb|tty|hidraw", GOTO="artery32_udev_rules_end"
#
# # Artery tek
# ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="f000", MODE="660", GROUP="plugdev", TAG+="uaccess"
# ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="660", GROUP="plugdev", TAG+="uaccess"
#
# # If you share your linux system with other users, or just don't like the
# # idea of write permission for everybody, you can replace MODE:="0666" with
# # OWNER:="yourusername" to create the device owned by you, or with
# # GROUP:="somegroupname" and mange access using standard unix groups.
#
# LABEL="artery32_udev_rules_end"
# EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/ATLink_Console "\$@"
EOF

}
