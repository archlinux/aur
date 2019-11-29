# Maintainer: kumen
pkgname="nrfconnect-appimage"
pkgver=3.3.0
pkgrel=1
pkgdesc="Cross-platform development software for Bluetooth Low Energy and cIoT"
arch=("x86_64")
depends=()
optdepends=('jlink-software-and-documentation')
conflicts=()
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/"
license=('Commercial')
options=(!strip)

_file_name="nrfconnect330x8664.AppImage"


source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-3-0/${_file_name}"
	$pkgname.desktop)
sha256sums=('3d2c637a42971ff50196567c93550167bdcf308fd71b33375414526f826627a3'
	'077a87113e3bb79ef7d5163497fee9f52268dff9a74229c2d4b117ef71d94165')

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
