# Maintainer: kumen

pkgname="embedded-studio"
pkgver=5.32a
pkgrel=1
pkgdesc="Segger Embedded Studio for ARM"
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
	
sha256sums_x86_64=('37d142da0a84b114c844c64b35cad398f3203fd01eb6759f39462744b382022f')
sha256sums_i686=('566e009ac23193eedaecd3e2b325b966f7484bb2ba912391de3b551759086c3a')

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

	msg2 'Installing Embedded Studio ARM'
	"$srcdir"/embedded-studio/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio/  --accept-license --no-upgrade

	msg2 'Instalation of binary file'
	ln -s /opt/SEGGER/Embedded-Studio/bin/emStudio "${pkgdir}/usr/bin"

	msg2 'Installing desktop shortcut and icon'
	install -Dm 644 "${pkgdir}/opt/SEGGER/Embedded-Studio/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=Embedded Studio
Comment=Embedded Studio for ARM
GenericName=Embedded Studio
Exec=env GDK_BACKEND=x11 emStudio %F
Icon=embedded-studio
Path=/opt/SEGGER/Embedded-Studio/bin
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END
	
	msg2 'Instalation of license file'
	ln -s /opt/SEGGER/Embedded-Studio/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname}/"
	
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
