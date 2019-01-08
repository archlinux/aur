# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=uppsala-linux-printer
pkgver=17.2.3
pkgrel=2
pkgdesc="Connect to the EduPrint system at Uppsala universitet (unofficial package)"
arch=('any')
url="https://www.uu.se/en/students/it-for-students/copy-and-print/"
license=(custom)
depends=('java-environment>=8' 'cups')
makedepends=()
install="${pkgname}.install"
source=("${pkgname}.tar.gz::https://mp.uu.se/documents/432512/127186965/eduprint-linux.tgz/21230058-0d34-6dd7-0102-d7f4e53d193e")
sha256sums=('c4a39db6e522ae6e7075d6450d6181c88e3a3d9b314f8be28ff53118f6c07a4b')

_ppd_file='eduPrint_UU_Linux_Ricoh_MP_C5504ex_PS.ppd'
_autostart='eduprint.service'
_desktop='eduprint.desktop'
_command='eduprint'

prepare() {

	cat <<-EOF

	NOTE: This PKGBUILD file is NOT PROVIDED NOR MAINTAINED by the
	      University. It will download and package the official
	      PaperCut MF client provided by the University for the
	      EduPrint system, allowing it to be managed by pacman.

	EOF


	cd "${srcdir}/eduprint-linux-client"

	# shut up
	sed -i 's,echo,: #echo,' install-eduprint-client.sh

	# fakeroot
	sed -i "s,\([[:space:]]\)/,\1${pkgdir}/," install-eduprint-client.sh

	# make path
	sed -i 's,\bmkdir\b,mkdir -p,' install-eduprint-client.sh

	# Java is already a dependency (moreover, this version check is faulty)
	sed -i 's,JAVA_VERSION=.*,JAVA_VERSION="true",' install-eduprint-client.sh

	# do not try to install the printer at package creation
	sed -i 's,^\([[:space:]]*lpadmin[[:space:]].*\),:\n#\1,' install-eduprint-client.sh

	# create autostart file
	cat > ${_autostart} <<-EOF
	[Desktop Entry]
	Exec=/usr/share/eduprint-client/pc-client-linux.sh
	Name=EduPrint
	StartupNotify=true
	Terminal=false
	Type=Application
	EOF

	# create command
	cat > ${_command} <<-EOF
	#!/usr/bin/env bash
	/usr/share/eduprint-client/pc-client-linux.sh
	EOF

	# create .desktop entry
	cat > ${_desktop} <<-EOF
	[Desktop Entry]
	Name=EduPrint
	Exec=/usr/bin/${_command}
	Icon=printer
	Terminal=false
	Type=Application
	EOF
}

package() {
	cd "${srcdir}/eduprint-linux-client"

	bash install-eduprint-client.sh

	# provide printer descriptor
	install -D -m644 ${_ppd_file} ${pkgdir}/etc/cups/ppd/${_ppd_file}

	# provide autostart entry
	install -D -m644 ${_autostart} ${pkgdir}/etc/xdg/autostart/${_autostart}

	# provide command
	install -D -m755 ${_command} ${pkgdir}/usr/bin/${_command}

	# provide .desktop entry
	install -D -m755 ${_desktop} ${pkgdir}/usr/share/applications/${_desktop}
}

