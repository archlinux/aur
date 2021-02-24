# Maintainer: kumen

pkgname="embedded-studio-arm"
pkgver=5.40b
pkgrel=1
pkgdesc="Segger Embedded Studio for ARM"
arch=("x86_64")
makedepends=()
depends=('jlink-software-and-documentation')
optdepends=()
conflicts=()
replaces=('embedded-studio')
url="https://www.segger.com/products/development-tools/embedded-studio/"
license=('Commercial')
options=(!strip)

source_x86_64=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz")
source_i686=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x86.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x86.tar.gz")
	
sha256sums_x86_64=('4c2779a8761aa8b7c1c309f250bb592e12bac341ea2f4a04cb95498e61e3af1d')
sha256sums_i686=('244e99d91782802e37d8cb5eecb09ca004ae619747e579750fb0854efd8866de')

prepare(){
	# Change src path name
	if [ ${CARCH} = "i686" ]; then
		mv arm_segger_embedded_studio_${pkgver/./}_linux_x86 embedded-studio-arm
	else 
		mv arm_segger_embedded_studio_${pkgver/./}_linux_x64 embedded-studio-arm
	fi
}

package() {
	install -dm755 "${pkgdir}/opt/SEGGER/Embedded-Studio-ARM" \
		    "${pkgdir}/usr/share/licenses/${pkgname}" \
		    "${pkgdir}/usr/bin/" \

	msg2 'Installing Embedded Studio ARM'
	"$srcdir"/embedded-studio-arm/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio-ARM/  --accept-license --no-upgrade

	msg2 'Instalation of binary file'
	ln -s /opt/SEGGER/Embedded-Studio-ARM/bin/emStudio "${pkgdir}/usr/bin/emStudio-ARM"

	msg2 'Installing desktop shortcut and icon'
	install -Dm 644 "${pkgdir}/opt/SEGGER/Embedded-Studio-ARM/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=ARM Embedded Studio
Comment=Embedded Studio for ARM
GenericName=Embedded Studio ARM
Exec=env GDK_BACKEND=x11 emStudio-ARM %F
Icon=embedded-studio-arm
Path=/opt/SEGGER/Embedded-Studio-ARM/bin
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END
	
	msg2 'Instalation of license file'
	ln -s /opt/SEGGER/Embedded-Studio-ARM/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname}/"
	
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
