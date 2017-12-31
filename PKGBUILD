# Maintainer: Johannes Sjölund <j dot sjolund at gmail dot com>
pkgname=truestudio
pkgver=8.1.0
pkgrel=1
pkgdesc="A flexible and extensible Arm development and debugging IDE by Atollic."
arch=('x86_64')
url="https://atollic.com/truestudio/"
license=(custom)
depends=('aksusbd' 'java-runtime' 'lib32-glibc' 'libusb' 'ncurses5-compat-libs')
options=(!strip)
install=$pkgname.install
source=(http://download.atollic.com/TrueSTUDIO/installers/Atollic_TrueSTUDIO_for_ARM_linux_x86_64_v8.1.0_20171023-2304.tar.gz)
sha256sums=('dcc6e2adaada3efa6998db3868c9b5d8ad7a8c9c1dd2f295c5ae3330d3499176')

prepare(){
	msg2 'Unpacking TrueSTUDIO'
	install -d -m755  "${srcdir}/${pkgname}"
	install -d -m755  "${srcdir}/aksusbd"
	tar xvf "${srcdir}/Atollic_TrueSTUDIO_for_ARM_${pkgver}_installer/install.data" -C "${srcdir}/${pkgname}"
	tar xvf "${srcdir}/${pkgname}/ide/aksusbd-7.54.1-i386.tar.gz" --strip-components=1 -C "${srcdir}/aksusbd"
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
	install -Dm644 "${srcdir}/Atollic_TrueSTUDIO_for_ARM_${pkgver}_installer/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 'Installing udev rules'
	install -Dm644 "${srcdir}/${pkgname}/Servers/J-Link_gdbserver/99-jlink.rules" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"
	install -Dm644 "${srcdir}/${pkgname}/Servers/PE_Micro_gdbserver/drivers/libusb_64_32/55-pemicro.rules" "${pkgdir}/etc/udev/rules.d/55-pemicro.rules"
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
	cat <<EOF > "${pkgdir}/usr/share/applications/TrueSTUDIO-for-ARM-x86_64-${pkgver}.desktop"
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

	cat <<EOF > "${pkgdir}/usr/share/applications/TrueSTUDIO-licensemanager-x86_64-${pkgver}.desktop"
[Desktop Entry]
Name=License Manager for Atollic TrueSTUDIO ${pkgver}
Comment=License Manager for Atollic TrueSTUDIO ${pkgver}
GenericName=License Manager for TrueSTUDIO
Exec=/opt/${pkgname}/ide/licensemanager %F
Icon=/opt/${pkgname}/ide/TrueSTUDIO.ico
Path=/opt/${pkgname}/ide/
Terminal=false
StartupNotify=true
Type=Application
Categories=System;Utility;Settings
EOF

	msg2 'Installing HASP vendor library'
	install -Dm555 "${srcdir}/aksusbd/haspvlib_96952.so" "${pkgdir}/var/hasplm/update/haspvlib_96952.so"
}
