# Maintainer: Geyslan G. Bem <geyslan@gmail.com>

pkgname=pje-office
pkgver=1.0.9
pkgrel=1
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('any')
url='http://www.cnj.jus.br/wiki/index.php/PJeOffice'
license=('custom')
depends=('java-environment' 'bash')
source=(ftp://ftp.cnj.jus.br/pje/programs/${pkgname}/${pkgname}_${pkgver}_amd64.deb)
install=${pkgname}.install
md5sums=('8f512be74dca24d2a7ac70881dab742c')

_fix() {
	local _launcher

	# why waste space?
	rm -rf usr/share/${pkgname}/jre

	# new launcher using default installed java
	_launcher=usr/share/${pkgname}/pjeOffice.sh
	echo "#!/bin/bash" > ${_launcher}
	echo -e "# PJeOffice CLEAN script\n" >> ${_launcher}
	echo -e "echo \"Iniciando o PJeOffice!\"\n" >> ${_launcher}
	echo -e "$(which java) -jar /usr/share/${pkgname}/pjeOffice.jar" >> ${_launcher}

	# load icon from package path
	sed -i "s/^Icon=.*/Icon=\/usr\/share\/${pkgname}\/shortcuts\/icons\/PJeOffice.png/" usr/share/${pkgname}/shortcuts/${pkgname}.desktop
}

_clinks() {
	local _basepath
	_basepath=usr/share/${pkgname}

	# creating symbolic links
	mkdir -p usr/bin
	ln -sf /${_basepath}/pjeOffice.sh usr/bin/pjeOffice
	mkdir -p usr/share/applications
	ln -sf /${_basepath}/shortcuts/${pkgname}.desktop usr/share/applications/${pkgname}.desktop
}

prepare() {
	tar xf data.tar.xz
	_fix
	_clinks
}

package() {
	cp -R usr/ ${pkgdir}
	chmod 755 ${pkgdir}/usr/share/pje-office/pjeOffice.sh
}
