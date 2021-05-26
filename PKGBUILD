# Maintainer: taotieren <admin@taotieren.com>

pkgbase=sunxi-livesuite-git
pkgname=($pkgbase{,-dkms})
pkgver=1a0b52a
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/linux-sunxi/sunxi-livesuite"
license=('GPLv2')
provides=()
conflicts=(${pkgbase} ${pkgbase%-git})
#replaces=(${pkgname})
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
groups=($pkgbase)
source=("${pkgbase%-git}::git+${url}.git"
        "git+https://github.com/M0Rf30/sunxi-awusb.git"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase%-git}"
    git describe --always | sed 's|-|.|g'
}

package_sunxi-livesuite-git() {
    pkgdesc="LiveSuit is a tool to flash Images to the NAND of Allwinner devices."
    depends=('sunxi-livesuite-git-dkms')

    install -dm0755 "${pkgdir}/opt/sunxi/${pkgbase%-git}"
    cp -r "${srcdir}/${pkgbase%-git}/x86" "${pkgdir}/opt/sunxi/${pkgbase%-git}"
    cp -r "${srcdir}/${pkgbase%-git}/x86-64" "${pkgdir}/opt/sunxi/${pkgbase%-git}"
    cp -r "${srcdir}/${pkgbase%-git}/LiveSuit.sh" "${pkgdir}/opt/sunxi/${pkgbase%-git}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgbase%-git}" << EOF
#!/bin/env bash

cd /opt/sunxi/${pkgbase%-git}/
bash LiveSuit.sh
EOF

    install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgbase%-git}
Comment=${pkgbase%-git}
GenericName=${pkgbase%-git}
Exec=${pkgbase%-git}
Icon=
Path=/opt/sunxi/${pkgbase%-git}
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF

}

package_sunxi-livesuite-git-dkms() {
    pkgdesc="DKMS module for Allwinner devices"
    depends=('dkms')
    conflicts=('sunxi-awusb-dkms')
    cd "${srcdir}/sunxi-awusb/"
    install -Dt "${pkgdir}/usr/src/${pkgname}" -m644 awusb.c Makefile dkms.conf
    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-aw_usb.rules" << EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "udevadm control --reload"

# This rules are based on the udev rules from the OpenOCD project, with unsupported probes removed.
# See http://openocd.org/ for more details.
#
# This file is available under the GNU General Public License v2.0

ACTION!="add|change", GOTO="aw_usb_rules_end"

#SUBSYSTEM=="gpio", MODE="0660", GROUP="plugdev", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="aw_usb_rules_end"

# [GNU MCU Eclipse] -----------------------------------------------------------
# To simplify access, the access rights were changed from:
#   MODE="660", GROUP="plugdev", TAG+="uaccess"
# to:
#   MODE="666"
# -----------------------------------------------------------------------------

# Please keep this list sorted by VID:PID

# aw
# define USB_AW_VENDOR_ID	0x1f3a
# define USB_AW_PRODUCT_ID	0xefe8
ATTR{idVendor}=="1F3A", ATTR{idProduct}=="EFE8", MODE="666"

LABEL="aw_usb_rules_end"
EOF

    install -dm0755 "${pkgdir}/etc/udev/rules.d"
    ln -sf "/usr/lib/udev/rules.d/99-aw_usb.rules" "${pkgdir}/etc/udev/rules.d/99-aw_usb.rules"

}
