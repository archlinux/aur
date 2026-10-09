# Maintainer: kumen
pkgname="ucpd-monitor"
pkgver=3.2.7
pkgrel=1
pkgdesc="A cross-platform Electron desktop application for real-time monitoring and analysis of USB Power Delivery (PD) communication captured by STM32 UCPD hardware."
arch=("x86_64")
depends=('alsa-lib' 'gtk3' 'nss')
conflicts=()
url="https://github.com/aso/UCPD-Monitor/tree/main"
license=('MIT')
options=(!strip)

_file_name="UCPD-Monitor-${pkgver}.AppImage"

source=("https://github.com/aso/UCPD-Monitor/releases/download/v${pkgver}/${_file_name}"
	"ucpd-monitor.desktop")
sha256sums=('c14cd44421ab57b20ab8cd01e48c1167a5145a51ac60b45c3ac3831d99ab40d1'
	    '70fa7e53f9aba409e044f3a3afd03f37b63e9bb9633093c7312de3564984f184')

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
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -Dm 644  "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	# move icon files to /usr
        msg2 'Installing icons'
	install -d -m755 "${pkgdir}/usr/share/pixmaps//"
        install -Dm 644  "${srcdir}/squashfs-root/usb-pd-monitor.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	# fix file permissions - all directories as 755
	find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
	
	mv "${pkgdir}/opt/${pkgname}/usb-pd-monitor" "${pkgdir}/opt/${pkgname}/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"
	install -d -m755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
