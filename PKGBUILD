# Maintainer: kumen

pkgname="embedded-studio-risc-v"
pkgver=7.32a
pkgrel=2
pkgdesc="Segger Embedded Studio for RISC-V"
arch=('x86_64' 'aarch64')
makedepends=()
depends=('jlink-software-and-documentation')
optdepends=()
conflicts=()
url="https://www.segger.com/products/development-tools/embedded-studio/"
license=('Commercial')
options=(!strip)

source_x86_64=("Setup_EmbeddedStudio_RISCV_v${pkgver/./}_linux_x64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_RISCV_v${pkgver/./}_linux_x64.tar.gz")
source_aarch64=("Setup_EmbeddedStudio_RISCV_v${pkgver/./}_linux_arm64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_RISCV_v${pkgver/./}_linux_arm64.tar.gz")

md5sums_x86_64=('4d8159bfcbd8eea85fbff146400e6e30')
md5sums_aarch64=('daf396b6b493e38f50e5792aeb67b471')

prepare(){
	# Delete potential previous build
	rm -rf embedded-studio-risc-v
	
	# Change src path name
        case ${CARCH} in
	  "x86_64")
	    mv riscv_segger_embedded_studio_v${pkgver/./}_linux_x64 embedded-studio-risc-v
	    ;;

	  "aarch64")
	    mv riscv_segger_embedded_studio_v${pkgver/./}_linux_arm64 embedded-studio-risc-v
	    ;;
	esac
}

package() {
	install -dm755 "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V" \
                    "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/lib" \
		    "${pkgdir}/usr/share/licenses/${pkgname}" \
		    "${pkgdir}/usr/bin/" \

	msg2 'Installing Embedded Studio RISC-V'
	"$srcdir"/embedded-studio-risc-v/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/  --accept-license --no-upgrade
        
	msg2 'Redirect library build directory to cache directory'
	rmdir "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/lib"
        install -dm 777 "${pkgdir}/var/cache/${pkgname}/lib/"
        ln -s /var/cache/${pkgname}/lib "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/lib"

	msg2 'Instalation of binary file'
	ln -s /opt/SEGGER/Embedded-Studio-RISC-V/bin/emStudio "${pkgdir}/usr/bin/emStudio-RISC-V"
        ln -s /opt/SEGGER/Embedded-Studio-RISC-V/bin/emBuild "${pkgdir}/usr/bin/emBuild-RISC-V"

	msg2 'Installing desktop shortcut and icon'
	install -Dm 644 "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=RISC-V Embedded Studio
Comment=Embedded Studio for RISC-V
GenericName=Embedded Studio RISC-V
Exec=env GDK_BACKEND=x11 emStudio-RISC-V %F
Icon=embedded-studio-risc-v
Path=/opt/SEGGER/Embedded-Studio-RISC-V/bin
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END
	
	msg2 'Instalation of license file'
	ln -s /opt/SEGGER/Embedded-Studio-RISC-V/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname}/"
	
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
