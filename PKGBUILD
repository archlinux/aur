# Maintainer: taotieren <admin@taotieren.com>

pkgname="linux-studio-bin"
pkgver=5.30
pkgrel=1
pkgdesc="Segger Linux Studio is an all-in-one solution for application development on Linux."
arch=('x86_64' 'i686')
makedepends=()
depends=('jlink-software-and-documentation')
optdepends=('embedded-studio-arm: Segger Embedded Studio for ARM'
            'embedded-studio-arm-nordic: Segger Embedded Studio for ARM, Nordic version'
            'embedded-studio-risc-v: Segger Embedded Studio for RISC-V'
            'ozone: Segger Ozone JLink debugger for Linux'
            'jlink-systemview: Segger SystemView for Linux'
            'jlink-systemview-target-src: Segger SystemView target src for Linux'
            'pylink: Python interface for the SEGGER J-Link')
conflicts=()
url="https://www.segger.com/products/development-tools/linux-studio/"
license=('Commercial')
options=(!strip)

source_x86_64=("Setup_LinuxStudio_v${pkgver/./}_x64.tar.gz::https://www.segger.com/downloads/linux-studio/Setup_LinuxStudio_v${pkgver/./}_x64.tar.gz")
source_i686=("Setup_LinuxStudio_v${pkgver/./}_x86.tar.gz::https://www.segger.com/downloads/linux-studio/Setup_LinuxStudio_v${pkgver/./}_x86.tar.gz")

sha256sums_x86_64=('4af7446a418212869e9ef854347cdbd9b4c31694819252b149a84571ebdbe266')
sha256sums_i686=('c252f89f0718def93c817d93734a301f4207794f344c5771ade203cefe315ad5')

prepare(){
        # Change src path name
        case ${CARCH} in
	  "x86_64")
	    mv segger_linux_studio_v${pkgver/./}_x64 linux_studio
	    ;;

	  "i686")
	    mv segger_linux_studio_v${pkgver/./}_x86 linux_studio
	    ;;
	esac
}

package() {
        install -dm755 "${pkgdir}/opt/SEGGER/Linux-Studio" \
                    "${pkgdir}/usr/share/licenses/${pkgname%-bin}" \
                    "${pkgdir}/usr/bin/" \

        msg2 'Installing Linux Studio'
        "$srcdir"/linux_studio/install_segger_studio --copy-files-to ${pkgdir}/opt/SEGGER/Linux-Studio/  --accept-license --no-upgrade

        msg2 'Instalation of binary files'
        ln -s /opt/SEGGER/Linux-Studio/bin/emStudio "${pkgdir}/usr/bin/emStudio-Linux"
        ln -s /opt/SEGGER/Linux-Studio/bin/emBuild "${pkgdir}/usr/bin/emBuild-Linux"

        msg2 'Installing desktop shortcut and icon'
        install -Dm 644 "${pkgdir}/opt/SEGGER/Linux-Studio/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
        install -Dm 644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop" <<EOF
[Desktop Entry]
Name=Linux Studio
Comment=Linux Studio
GenericName=Linux Studio
Exec=env GDK_BACKEND=x11 emStudio-Linux %F
Icon=linux-studio
Path=/opt/SEGGER/Linux-Studio/bin
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF

        msg2 'Instalation of license file'
        ln -s /opt/SEGGER/Linux-Studio/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
