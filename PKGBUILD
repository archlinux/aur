# Maintainer: Johannes Sjölund <j dot sjolund at gmail dot com>
pkgname=truestudio
pkgver=9.0.0
pkgrel=2
pkgdesc="A flexible and extensible Arm development and debugging IDE by Atollic."
arch=('x86_64')
url="https://atollic.com/truestudio/"
license=(custom)
depends=('java-runtime' 'lib32-glibc' 'libusb' 'ncurses5-compat-libs' 'webkit2gtk')
options=(!strip)
source=(http://download.atollic.com/TrueSTUDIO/installers/Atollic_TrueSTUDIO_for_STM32_linux_x86_64_v${pkgver}_20180117-1023.tar.gz)
sha256sums=('450a1ae159ff58799af9a8190b801ac11c02e11c1578d23120689074c60a444b')

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
	install -Dm644 "${srcdir}/${pkgname}/Servers/J-Link_gdbserver/99-jlink.rules" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"
	install -Dm644 "${srcdir}/${pkgname}/Servers/ST-LINK_gdbserver/49-stlinkv2-1.rules" "${pkgdir}/etc/udev/rules.d/49-stlinkv2-1.rules"
	install -Dm644 "${srcdir}/${pkgname}/Servers/ST-LINK_gdbserver/49-stlinkv2.rules" "${pkgdir}/etc/udev/rules.d/49-stlinkv2.rules"

	msg2 'Registering installation'
	install -d -m755 "${pkgdir}/etc/atollic"
	cat <<EOF > "${pkgdir}/etc/atollic/TrueSTUDIO_for_ARM_x86_64_${pkgver}.properties"
# TrueSTUDIO for ARM properties for version ${pkgver}
path=/opt/${pkgname}
family=ARM
arch=x86_64
version=${pkgver}
EOF
	
	msg2 'Installing desktop shortcuts'
	install -d -m755 "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/TrueSTUDIO-for-STM32-x86_64-${pkgver}.desktop"
[Desktop Entry]
Name=Atollic TrueSTUDIO for ARM ${pkgver}
Comment=Atollic TrueSTUDIO for ARM ${pkgver}
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
