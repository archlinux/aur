# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=3.6.1
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=('jlink-software-and-documentation')
optdepends=('nrf-udev')
conflicts=()
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect361x8664.AppImage"

source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-6-1/${_file_name}")
sha256sums=('6178e276cebde15bab49d86ed8942c366c66b691df6aba59e76c494f7a202425')

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
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=nRF Connect
Comment=nRF Connect for PC
GenericName=nRF Connect
Exec=/opt/nrfconnect-appimage/nrfconnect %F
Icon=/opt/nrfconnect-appimage/usr/share/icons/hicolor/0x0/apps/nrfconnect.png
Path=/opt/nrfconnect-appimage/
Terminal=false
Type=Application
StartupWMClass=nRF Connect
StartupNotify=true
Categories=Development
END
	
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
