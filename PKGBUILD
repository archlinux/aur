# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=5.3.0
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=('nrf-udev' 'jlink-software-and-documentation' 'libusb' 'fuse2')
optdepends=('nrfutil')
conflicts=()
url="https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-desktop"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect-${pkgver}-x86_64.AppImage"

source=("https://github.com/NordicSemiconductor/pc-nrfconnect-launcher/releases/download/v${pkgver}/${_file_name}")
sha512sums=('dad29bca22a060dc7bc870427ff60df84acc517d78be1c9d912f430b7e532e03744197e3d1be5f49af5b2693f27e63c202b57f66b594e9078af64931e30214a1')

prepare(){
	# mark as executable
	chmod +x "${srcdir}/${_file_name}"

	# extract
	${srcdir}/${_file_name} --appimage-extract
}

package() {
	# install the main files.
        msg2 'Installing application'
	install -d -m755 "${pkgdir}/opt/${pkgname}"
	cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

        msg2 'Installing desktop shortcuts'
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=nRF Connect
Comment=nRF Connect for Desktop
GenericName=nRF Connect
Exec=nrfconnect %F
Icon=nrfconnect
Path=/opt/nrfconnect-appimage/
Terminal=false
Type=Application
StartupWMClass=nRF Connect for Desktop
StartupNotify=true
Categories=Development
END
	
	# move icon files to /usr
        msg2 'Installing icons'
	mv "${pkgdir}/opt/${pkgname}/usr/share/icons" "${pkgdir}/usr/share/"
	
	# fix file permissions - all directories as 755
	find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
	
	chmod +x "${pkgdir}/opt/${pkgname}/nrfconnect"
	install -d -m755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/${pkgname}/nrfconnect" "${pkgdir}/usr/bin/nrfconnect"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
