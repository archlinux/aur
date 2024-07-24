# Maintainer: Geyslan G. Bem <geyslan@gmail.com>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>

pkgname=pje-office
pkgver=2.5.16u
pkgrel=1
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('any')
url='https://pjeoffice.trf3.jus.br'
license=('custom')
options=(!debug)
depends=('jre11-openjdk' 'bash')
makedepends=('wget')
source=(https://pje-office.pje.jus.br/pro/pjeoffice-pro-v${pkgver}-linux_x64.zip)
install=${pkgname}.install
md5sums=('363f11dccfaf875634d19af0e6720be0')

_fix() {
	local _launcher
	local _desktop

	# why waste space?
	rm -rf usr/share/pjeoffice-pro/jre

	# new launcher using default installed java
	_launcher=usr/share/pjeoffice-pro/pjeoffice-pro.sh
	echo "#!/bin/bash" > ${_launcher}
	echo -e "# PJeOffice CLEAN script\n" >> ${_launcher}
	echo -e "echo \"Iniciando o PJeOffice!\"\n" >> ${_launcher}
        echo -e export PATH='"/usr/lib/jvm/java-11-openjdk/bin/:$PATH"' >> ${_launcher}
	echo -e exec java -jar /usr/share/pjeoffice-pro/pjeoffice-pro.jar '"$@"' >> ${_launcher}

	# create new .desktop launcher
        _desktop=usr/share/pjeoffice-pro/pje-office.desktop
	echo -e [Desktop Entry] > ${_desktop}
	echo -e Encoding=UTF-8 >> ${_desktop}
	echo -e Name=PJeOffice >> ${_desktop}
	echo -e GenericName=PJeOffice >> ${_desktop}
	echo -e Exec=/usr/bin/pjeoffice-pro >> ${_desktop}
	echo -e Type=Application >> ${_desktop}
	echo -e Terminal=false >> ${_desktop}
	echo -e 'Categories=Office;' >> ${_desktop}
	echo -e Comment=PJeOffice >> ${_desktop}
	echo -e Icon=pjeoffice >> ${_desktop}
}

_clinks() {
	local _basepath
	_basepath=usr/share/pjeoffice-pro

	# creating symbolic links
	mkdir -p usr/bin
	ln -sf /${_basepath}/pjeoffice-pro.sh usr/bin/pjeoffice-pro
	mkdir -p usr/share/applications
	ln -sf /${_basepath}/${pkgname}.desktop usr/share/applications/${pkgname}.desktop
}

prepare() {
        mkdir -p usr/share/icons
        rm pjeoffice-pro/.gitignore
        mv pjeoffice-pro usr/share
        wget https://www.pje.jus.br/wiki/skins/common/images/pje.png -O usr/share/icons/pjeoffice.png
	_fix
	_clinks
}

package() {
	cp -R usr/ ${pkgdir}
	chmod 755 ${pkgdir}/usr/share/pjeoffice-pro/pjeoffice-pro.sh
}
