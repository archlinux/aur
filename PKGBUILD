# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=3.5.0
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=(jlink-software-and-documentation)
optdepends=()
conflicts=()
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect350x8664.AppImage"

source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-5-0/${_file_name}"
	$pkgname.desktop)
sha256sums=('90b320b9f42721ae90e61034055abfaad7edbc1fc920257abcad2e345ab6b3c5'
	'b387e021edbb03521dc656e8eac14c84d9511e0af6f0ab4559ec42800220c96d')

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
