# Maintainer: Geyslan G. Bem <geyslan@gmail.com>

pkgname=pje-office
pkgver=1.0.19
pkgrel=1
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('any')
url='http://www.cnj.jus.br/wiki/index.php/PJeOffice'
license=('custom')
depends=('java-runtime' 'bash')
source=(http://ftp.cnj.jus.br/pje/programs/${pkgname}-${pkgver}/${pkgname}_${pkgver}_amd64.deb)
install=${pkgname}.install
md5sums=('c004c0ff3d73ef878d4b2e83120e5e4f')

_fix() {
	local _launcher

	# why waste space?
	rm -rf usr/share/${pkgname}/jre

	# new launcher using default installed java
	_launcher=usr/share/${pkgname}/pjeOffice.sh
	echo "#!/bin/bash" > ${_launcher}
	echo -e "# PJeOffice CLEAN script\n" >> ${_launcher}
	echo -e "echo \"Iniciando o PJeOffice!\"\n" >> ${_launcher}
	echo -e "java -jar /usr/share/${pkgname}/pjeOffice.jar" >> ${_launcher}

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
