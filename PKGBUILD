# Maintainer: kumen

pkgname="embedded-studio"
pkgver=8.18
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

source_x86_64=("Setup_EmbeddedStudio_v${pkgver/./}_linux_x64.tar.gz::https://dl.a.segger.com/embedded-studio/Setup_EmbeddedStudio_v${pkgver/./}_linux_x64.tar.gz")
source_aarch64=("Setup_EmbeddedStudio_v${pkgver/./}_linux_arm64.tar.gz::https://dl.a.segger.com/embedded-studio/Setup_EmbeddedStudio_v${pkgver/./}_linux_arm64.tar.gz")
	
md5sums_x86_64=('c3d41efd41656a2aae1bd7a74097f74f')
md5sums_aarch64=('82bde3134eef58c4de62b1cf94568d24')

source=("embedded-studio.desktop")
sha256sums=('SKIP')

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
