# Maintainer: taotieren <admin@taotieren.com>

pkgname=artery-isp-console-bin
pkgver=3.0.0
pkgrel=3
# epoch=1
pkgdesc="Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。"
arch=('x86_64')
url="https://bbs.21ic.com/icview-3148260-1-1.html"
license=('Commercial')
provides=(Artery_ISP_Console)
conflicts=()
replaces=()
depends=('icu' 'qt5-base' 'gcc-libs' 'glibc' 'systemd-libs' 'zlib' 'double-conversion' 'pcre2' 'zstd' 'glib2' 'xz' 'lz4' 'libcap' 'libgcrypt' 'libgpg-error')
makedepends=('unarchiver')
backup=()
options=('!strip')
#install=${pkgname}.install

_pkg_file_name=Artery_ISP_Console_V${pkgver}.zip
_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
   if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
      ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
   else
      msg2 ""
      msg2 "Package not found!"
      msg2 "The package can be downloaded here: ${url}"
      msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
      msg2 ""
   fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('49d963cf2051abfde3609c554f2589378889a3bac7f9d5a43c6e43d6924f43f9')
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
    install -Dm0644 DFU_download.sh  "${pkgdir}/opt/Artery32/${pkgname%-bin}/DFU_download.sh.template"
    install -Dm0644 USART_download.sh  "${pkgdir}/opt/Artery32/${pkgname%-bin}/USART_download.sh.template"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/udev/rules.d/90-artery32.rules" << EOF
# Copy this file to /etc/udev/rules.d/ or /usr/lib/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", SUBSYSTEM!="usb_device", GOTO="artery32_rules_end"

# SUBSYSTEM=="gpio", MODE="0666", GROUP="plugdev", TAG+="uaccess"

# SUBSYSTEM!="usb|tty|hidraw", GOTO="artery32_rules_end"

# Please keep this list sorted by VID:PID

# artery32
ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="666", GROUP="plugdev", TAG+="uaccess"
# BUS=='usb',
#ATTRS{manufacturer}=="*AT32*", MODE="0666", GROUP="plugdev", TAG+="uaccess"

LABEL="artery32_rules_end"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
/opt/Artery32/${pkgname%-bin}/AT32_ISP_Console "\$@"
EOF
}
