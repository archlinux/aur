# Maintainer: kumen

pkgname="embedded-studio-arm"
pkgver=7.12a
pkgrel=1
pkgdesc="Segger Embedded Studio for ARM"
arch=('x86_64' 'aarch64')
makedepends=()
depends=('jlink-software-and-documentation')
optdepends=()
conflicts=()
url="https://www.segger.com/products/development-tools/embedded-studio/"
license=('Commercial')
options=(!strip)

source_x86_64=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_x64.tar.gz")
source_aarch64=("Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_arm64.tar.gz::https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${pkgver/./}_linux_arm64.tar.gz")

md5sums_x86_64=('f7891845b2c004e9efaedd2c9fc1e841')
md5sums_aarch64=('2a17efaf8f6ff4315806e8f6c3f0183b')

prepare(){
	# Delete potential previous build
	rm -rf embedded-studio-arm
	
        # Change src path name
        case ${CARCH} in
	  "x86_64")
	    mv arm_segger_embedded_studio_v${pkgver/./}_linux_x64 embedded-studio-arm
	    ;;

	  "aarch64")
	    mv arm_segger_embedded_studio_v${pkgver/./}_linux_arm64 embedded-studio-arm
	    ;;
	esac
}

package() {
        install -dm755 "${pkgdir}/opt/SEGGER/Embedded-Studio-ARM" \
                    "${pkgdir}/usr/share/licenses/${pkgname}" \
                    "${pkgdir}/usr/bin/" \

        msg2 'Installing Embedded Studio ARM'
        "$srcdir"/embedded-studio-arm/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio-ARM/  --accept-license --no-upgrade
	chmod 755 "${pkgdir}/opt/SEGGER/Embedded-Studio-ARM/lib"

        msg2 'Instalation of binary files'
        ln -s /opt/SEGGER/Embedded-Studio-ARM/bin/emStudio "${pkgdir}/usr/bin/emStudio-ARM"
        ln -s /opt/SEGGER/Embedded-Studio-ARM/bin/emBuild "${pkgdir}/usr/bin/emBuild-ARM"

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
