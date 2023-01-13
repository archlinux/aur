# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nucleistudioide
pkgname=(nucleistudioide-bin)
pkgver=2022.12
pkgrel=0
pkgdesc="Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。"
arch=("x86_64")
depends=('nuclei-gcc-bin' 'nuclei-openocd-bin' 'nuclei-qemu-bin')
optdepends=('jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
makedepends=()
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)
source=("https://www.nucleisys.com/upload/files/nucleistudio/NucleiStudio_IDE_${pkgver/./}-lin64.tgz")
sha256sums=('82ee070565f6decd032440ff5199340d849306618206f4efc7b88be0a34e22ee')

package_nucleistudioide-bin() {
	cd "$srcdir"

	msg2 'Installing Nuclei Studio IDE'
	install -d -m755 "${pkgdir}/opt/nuclei"
	tar zxf "NucleiStudio_IDE_${pkgver/./}-lin64.tgz"
	rm -rf "NucleiStudio_IDE_${pkgver/./}/NucleiStudio/toolchain/openocd"
	rm -rf "NucleiStudio_IDE_${pkgver/./}/NucleiStudio/toolchain/gcc"
	rm -rf "NucleiStudio_IDE_${pkgver/./}/NucleiStudio/toolchain/qemu"
    
	mv "${srcdir}/NucleiStudio_IDE_${pkgver/./}/NucleiStudio" "${pkgdir}/opt/nuclei"

	msg2 'Instalation of binary file'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
/opt/nuclei/NucleiStudio/NucleiStudio "\$@"
EOF
	install -Dm644 /dev/stdin "${pkgdir}/etc/udev/rules.d/99-nuclei.rules" <<EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "udevadm control --reload"

# This rules are based on the udev rules from the OpenOCD project, with unsupported probes removed.
# See http://openocd.org/ for more details.
#
# This file is available under the GNU General Public License v2.0

ACTION!="add|change", GOTO="nuclei_rules_end"

#SUBSYSTEM=="gpio", MODE="0660", GROUP="plugdev", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="nuclei_rules_end"

# [GNU MCU Eclipse] -----------------------------------------------------------
# To simplify access, the access rights were changed from:
#   MODE="660", GROUP="plugdev", TAG+="uaccess"
# to:
#   MODE="666"
# -----------------------------------------------------------------------------

# Please keep this list sorted by VID:PID

# nuclei 
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", MODE="666", GROUP="plugdev"
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="666", GROUP="plugdev"

LABEL="nuclei_rules_end"
EOF

	msg2 'Installing desktop shortcut'
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=NucleiStudioIDE
Comment=NucleiStudioIDE
GenericName=NucleiStudioIDE
Exec=env GDK_BACKEND=x11 nucleistudioide %F
Icon=
Path=/opt/nuclei/NucleiStudio/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF

}


#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
