# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hpmicro-manufacturing-tool-bin
pkgname=${pkgbase}
_pkgname=HPMicro_Manufacturing_Tool
pkgver=0.5.0
pkgrel=2
pkgdesc="HPMicro Manufacturing Tool 是 HPMicro 公司推出的配置及批量烧写工具，旨在帮助企业用户快速批量的对 HPMicro 公司推出的芯片进行镜像配置及烧写。"
arch=(x86_64)
url="https://github.com/hpmicro/hpm_manufacturing_tool"
license=('LGPL-3.0-only')
groups=()
provides=(${pkgname%-bin}
    hpm-manufacturing-cmd
    hpm-manufacturing-gui)
conflicts=(${pkgname%-bin}
    hpm-manufacturing-cmd
    hpm-manufacturing-gui)
replaces=()
depends=(
    gcc-libs
    glibc
    libgpg-error
    perl
    systemd-libs
    zlib)
makedepends=()
checkdepends=()
optdepends=()
source=("${_pkgname}_v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}.tar.gz"
    "hpmicro.png")
sha256sums=('8a4bea2589138e5b473db1ff3853afb49c9867583f4382cd21472b24f0018f81'
    '07d6adc954e732986889ddbc8e972a69404b0097be541f61f0e23e0521a79e7f')
options=('!strip' '!debug' '!lto')

package() {
    install -dm775 ${pkgdir}/opt/hpmicro/${pkgname%-bin}
    install -dm755 ${pkgdir}/usr/bin \
        ${pkgdir}/usr/share/applications \
        ${pkgdir}/usr/lib/udev/rules.d

    install -Dm644 "${srcdir}/hpmicro.png" -t "${pkgdir}/usr/share/pixmaps"

    install -Dm755 /dev/stdin ${pkgdir}/usr/lib/udev/rules.d/71-hpmicro.usbhid.rules <<EOF
# Copy this file to /etc/udev/rules.d/ or /usr/lib/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", SUBSYSTEM!="usb_device", GOTO="hpmicro_rules_end"

#SUBSYSTEM=="gpio", MODE="0666", GROUP="uucp", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="hpmicro_rules_end"

# Please keep this list sorted by VID:PID

# Arch Linux hpmicro
ATTRS{idVendor}=="c251", MODE="0666", GROUP="uucp", TAG+="uaccess"
ATTRS{idVendor}=="34b7",MODE="0666",GROUP="uucp", TAG+="uaccess"

# Debian/Ubuntu Linux hpmicro
# ATTRS{idVendor}=="c251", MODE="0666", GROUP="dialout", TAG+="uaccess"
# ATTRS{idVendor}=="34b7", MODE="0666", GROUP="dialout", TAG+="uaccess"

LABEL="hpmicro_rules_end"
EOF

    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-bin}-user-manual-html.desktop <<EOF
[Desktop Entry]
Type=Application
Name=HPMicro Manufacturing Tool HTML User Manual
Name[zh_CN]=先辑制造工具 HTML 版用户手册
GenericName=HPMicro Manufacturing Tool HTML User Manual
GenericName[zh_CN]=先辑制造工具 HTML 版用户手册
Comment=electronics html
Exec=xdg-open /opt/hpmicro/${pkgname%-bin}/doc/user_manual.html
Icon=hpmicro.png
Terminal=false
Categories=Development;IDE;Electronics;
Keywords=embedded electronics;risc-v;microcontroller;
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-bin}-gui.desktop <<EOF
[Desktop Entry]
Type=Application
Name=HPMicro Manufacturing Tool GUI
Name[zh_CN]=先辑制造工具 GUI
GenericName=HPMicro Manufacturing Tool GUI
GenericName[zh_CN]=先辑制造工具 GUI
Comment=electronics gui
Exec=/opt/hpmicro/${pkgname%-bin}/hpm_manufacturing_gui
Icon=hpmicro.png
Terminal=false
Categories=Development;IDE;Electronics;
Keywords=embedded electronics;risc-v;microcontroller;
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-bin}-image-helper.desktop <<EOF
[Desktop Entry]
Type=Application
Name=HPMicro Manufacturing Tool Image Helper
Name[zh_CN]=先辑制造工具镜像帮助程序
GenericName=HPMicro Manufacturing Image Helper
GenericName[zh_CN]=先辑制造工具镜像帮助程序
Comment=electronics gui
Exec=/opt/hpmicro/${pkgname%-bin}/hpm_image_helper
Icon=hpmicro.png
Terminal=false
Categories=Development;IDE;Electronics;
Keywords=embedded electronics;risc-v;microcontroller;
EOF

    cd "${srcdir}/${_pkgname}_v${pkgver}"
    cp --preserve=mode -r . ${pkgdir}/opt/hpmicro/${pkgname%-bin}
    ln -sf /opt/hpmicro/${pkgname%-bin}/hpm_image_helper ${pkgdir}/usr/bin/hpm-image-helper
    ln -sf /opt/hpmicro/${pkgname%-bin}/hpm_img_util ${pkgdir}/usr/bin/hpm-img-util
    ln -sf /opt/hpmicro/${pkgname%-bin}/hpm_manufacturing_cmd ${pkgdir}/usr/bin/hpm-manufacturing-cmd
    ln -sf /opt/hpmicro/${pkgname%-bin}/hpm_manufacturing_gui ${pkgdir}/usr/bin/hpm-manufacturing-gui
}
