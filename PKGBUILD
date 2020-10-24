# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=3.6.0
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=('jlink-software-and-documentation')
optdepends=('nrf-udev')
conflicts=()
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect360x8664.AppImage"

source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-6-0/${_file_name}"
	$pkgname.desktop)
sha256sums=('a4b2248db7d46cbb61373762233d7e358987bdf6aaa8e72ac273657be5bdaafa'
	'e1643396521334eb81918c52c302d415e8d5965f6a556b9fc9db98b017f69b41')

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
