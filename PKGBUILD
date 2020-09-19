# Maintainer: kumen

pkgname="embedded-studio"
pkgver=5.10b
pkgrel=1
pkgdesc="SEGGER Embedded Studio for ARM"
arch=("x86_64")
makedepends=()
depends=('jlink-software-and-documentation')
optdepends=()
conflicts=()
url="https://www.segger.com/products/development-tools/embedded-studio/"
license=('Commercial')
options=(!strip)

source_x86_64=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz")
source_i686=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x86.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x86.tar.gz")
source=($pkgname.desktop)
	
sha256sums_x86_64=('0063ec3c3b7ba82c0df55732418637e2750567650516c0f62ba10eb3244f0e01')
sha256sums_i686=('f2c0bb150961f8e029ea0101a48aab92a4043b80ea623ec369d16ae36fb42c19')
sha256sums=('8d559936293917d566be7efb63ad4b18299ef0bad1656f9a939a4ac6d288576c')

prepare(){
	# Change src path name
	if [ ${CARCH} = "i686" ]; then
		mv arm_segger_embedded_studio_${pkgver/./}_linux_x86 embedded-studio
	else 
		mv arm_segger_embedded_studio_${pkgver/./}_linux_x64 embedded-studio
	fi
}

package() {
	install -dm755 "${pkgdir}/opt/SEGGER/Embedded-Studio" \
		    "${pkgdir}/usr/share/licenses/${pkgname}" \
		    "${pkgdir}/usr/bin/" \

	msg2 'Installing Embedded Studio'
	"$srcdir"/embedded-studio/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio/  --accept-license --no-upgrade

	msg2 'Instalation of binary file'
	ln -s /opt/SEGGER/Embedded-Studio/bin/emStudio "${pkgdir}/usr/bin"

	msg2 'Installing desktop shortcut and icon'
	install -Dm 644 "${pkgdir}/opt/SEGGER/Embedded-Studio/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	msg2 'Instalation of license file'
	ln -s /opt/SEGGER/Embedded-Studio/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname}/"
	
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
