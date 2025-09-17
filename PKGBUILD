# Maintainer: kumen

pkgname="embedded-studio"
pkgver=8.24
pkgrel=1
pkgdesc="Segger Embedded Studio"
arch=('x86_64' 'aarch64')
makedepends=('freetype2' 'fontconfig' 'libx11' 'libxext' 'libxrender')
depends=('glibc' 'gcc-libs' 'jlink-software-and-documentation' 'zlib')
optdepends=()
conflicts=()
url="https://www.segger.com/products/development-tools/embedded-studio/"
license=('Commercial')
options=(!strip)

source=("embedded-studio.desktop")
source_x86_64=("Setup_EmbeddedStudio_v${pkgver/./}_linux_x64.tar.gz::https://www.segger.com/fd/embedded-studio/Setup_EmbeddedStudio_v${pkgver/./}_Linux_x86_64.tar.gz")
source_aarch64=("Setup_EmbeddedStudio_v${pkgver/./}_linux_arm64.tar.gz::https://www.segger.com/fd/embedded-studio/Setup_EmbeddedStudio_v${pkgver/./}_Linux_arm64.tar.gz")

sha256sums=('89c05734c2ef04a44767e73c7d48f9feba104338e0ca87dfe4ab5e67e90628f6')
md5sums_x86_64=('61748d6abe688e4af92e17d2af3fccca')
md5sums_aarch64=('0ab50900692113ee0857c17e8ec068db')

prepare(){
	# Delete potential previous build
	rm -rf embedded-studio
	
        # Change src path name
        case ${CARCH} in
	  "x86_64")
	    mv segger_embedded_studio_v${pkgver/./}_linux_x64 embedded-studio
	    ;;

	  "aarch64")
	    mv segger_embedded_studio_v${pkgver/./}_linux_arm64 embedded-studio
	    ;;
	esac
}

package() {
	install -dm 755 "${pkgdir}/opt/SEGGER/Embedded-Studio"
	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -dm 755 "${pkgdir}/usr/bin/"

	msg2 'Installing Embedded Studio'
	"$srcdir"/embedded-studio/install_segger_embedded_studio --copy-files-to ${pkgdir}/opt/SEGGER/Embedded-Studio/  --accept-license --no-upgrade

	msg2 'Redirect library build directory to cache directory'
	rmdir "${pkgdir}/opt/SEGGER/Embedded-Studio/lib"
        install -dm 777 "${pkgdir}/var/cache/${pkgname}/lib/"
        ln -s /var/cache/${pkgname}/lib "${pkgdir}/opt/SEGGER/Embedded-Studio/lib"
        
	msg2 'Instalation of binary file'
        ln -s /opt/SEGGER/Embedded-Studio/bin/emStudio "${pkgdir}/usr/bin/emStudio"
        ln -s /opt/SEGGER/Embedded-Studio/bin/emBuild "${pkgdir}/usr/bin/emBuild"
	
	msg2 'Installing desktop shortcut and icon'
	install -dm 755 "${pkgdir}/usr/share/pixmaps/"
	install -dm 755 "${pkgdir}/usr/share/applications/"
	install -Dm 644 "${pkgdir}/opt/SEGGER/Embedded-Studio/bin/StudioIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	
	msg2 'Instalation of license file'
	ln -s /opt/SEGGER/Embedded-Studio/html/License.htm "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
