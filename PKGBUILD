# Maintainer: Johannes Sjölund <j dot sjolund at gmail dot com>
pkgname=truestudio
pkgver=9.3.0
pkgrel=1
pkgdesc="A flexible and extensible Arm development and debugging IDE by Atollic."
arch=('x86_64')
url="https://atollic.com/truestudio/"
license=(custom)
depends=('java-runtime' 'lib32-glibc' 'libusb' 'ncurses5-compat-libs' 'webkit2gtk' 'jlink-software-and-documentation')
options=(!strip)
source=(http://download.atollic.com/TrueSTUDIO/installers/Atollic_TrueSTUDIO_for_STM32_linux_x86_64_v${pkgver}_20190212-0734.tar.gz)
sha256sums=('804f1f4dfd32ca7a35b2ceb79bde4d87c597084ab3e2233de9635eee4042f19c')

prepare(){
	msg2 'Unpacking TrueSTUDIO'
	install -d -m755  "${srcdir}/${pkgname}"
	tar xvf "${srcdir}/Atollic_TrueSTUDIO_for_STM32_${pkgver}_installer/install.data" -C "${srcdir}/${pkgname}"
}

package() {
	cd $srcdir
	msg2 'Installing TrueSTUDIO tools'
	install -d -m755 "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/ARMTools" "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/PCTools" "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/Servers" "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/Tools" "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/ide" "${pkgdir}/opt/${pkgname}"
	
	msg2 'Installing license'
	install -Dm644 "${srcdir}/Atollic_TrueSTUDIO_for_STM32_${pkgver}_installer/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 'Installing udev rules'
	install -Dm644 "${srcdir}/${pkgname}/Servers/ST-LINK_gdbserver/49-stlinkv2-1.rules" "${pkgdir}/etc/udev/rules.d/49-stlinkv2-1.rules"
	install -Dm644 "${srcdir}/${pkgname}/Servers/ST-LINK_gdbserver/49-stlinkv2.rules" "${pkgdir}/etc/udev/rules.d/49-stlinkv2.rules"
	
	msg2 'Installing desktop shortcuts'
	install -d -m755 "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/TrueSTUDIO-for-STM32-x86_64-${pkgver}.desktop"
[Desktop Entry]
Name=Atollic TrueSTUDIO for STM32 ${pkgver}
Comment=Atollic TrueSTUDIO for STM32 ${pkgver}
GenericName=TrueSTUDIO
Exec=/opt/${pkgname}/ide/TrueSTUDIO %F
Icon=/opt/${pkgname}/ide/TrueSTUDIO.ico
Path=/opt/${pkgname}/ide/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
