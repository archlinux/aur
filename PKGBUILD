# Maintainer: Johannes Sjölund <j dot sjolund at gmail dot com>
pkgname=truestudio
pkgver=9.2.0
pkgrel=1
pkgdesc="A flexible and extensible Arm development and debugging IDE by Atollic."
arch=('x86_64')
url="https://atollic.com/truestudio/"
license=(custom)
depends=('java-runtime' 'lib32-glibc' 'libusb' 'ncurses5-compat-libs' 'webkit2gtk' 'jlink-software-and-documentation')
options=(!strip)
source=(http://download.atollic.com/TrueSTUDIO/installers/Atollic_TrueSTUDIO_for_STM32_linux_x86_64_v${pkgver}_20181203-0921.tar.gz)
sha256sums=('7488d87336d80d783df62a65e629c7eabfa003365520c9f99bc26489f66fc2a0')

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
#	install -Dm644 "${srcdir}/${pkgname}/Servers/J-Link_gdbserver/99-jlink.rules" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"
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
