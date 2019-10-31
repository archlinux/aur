# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=3.2.0
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=()
optdepends=('jlink-software-and-documentation')
conflicts=()
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect320x8664.AppImage"


source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-2-0/${_file_name}"
	$pkgname.desktop)
sha256sums=('f7ab05dca3b57a75c388010308f9a5fff7aeb0978d752ebe8ad1d5222e94b5f1'
	'b8ef1267458c372e430c33ae2e1b141418e31cb41fd727cc2a44ed055ccfe7d3')

prepare(){
	# mark as executable
	chmod +x "${srcdir}/${_file_name}"

	# extract
	${srcdir}/${_file_name} --appimage-extract
}

package() {
	# install the main files.
	install -d -m755 "${pkgdir}/opt/${pkgname}"
	cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

        msg2 'Installing desktop shortcuts'
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	# fix file permissions - all files as 644 - directories as 755
	find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
	find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
	
	chmod +x "${pkgdir}/opt/${pkgname}/nrfconnect"
	install -d -m755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/${pkgname}/nrfconnect" "${pkgdir}/usr/bin/nrfconnect"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
