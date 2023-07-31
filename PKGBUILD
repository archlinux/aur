# Maintainer: Geyslan G. Bem <geyslan@gmail.com>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>

pkgname=pje-office
pkgver=1.0.28
pkgrel=2
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('any')
url='http://www.cnj.jus.br/wiki/index.php/PJeOffice'
license=('custom')
depends=('jre11-openjdk' 'bash')
source=(${pkgname}-${pkgver}.deb::https://cnj-pje-programs.s3-sa-east-1.amazonaws.com/${pkgname}/${pkgname}_amd64.deb)
install=${pkgname}.install
md5sums=('53bc26336a03705cde57e99aa74fc4ed')

_fix() {
	local _launcher

	# why waste space?
	rm -rf usr/share/${pkgname}/jre

	# new launcher using default installed java
	_launcher=usr/share/${pkgname}/pjeOffice.sh
	echo "#!/bin/bash" > ${_launcher}
	echo -e "# PJeOffice CLEAN script\n" >> ${_launcher}
	echo -e "echo \"Iniciando o PJeOffice!\"\n" >> ${_launcher}
        echo -e export PATH='"/usr/lib/jvm/java-11-openjdk/bin/:$PATH"' >> ${_launcher}
	echo -e exec java -jar /usr/share/${pkgname}/pjeOffice.jar '"$@"' >> ${_launcher}

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
