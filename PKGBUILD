# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=sonarqube-lts
pkgver=4.5.4
pkgrel=1
pkgdesc='An open platform to manage code quality'
arch=('i686' 'x86_64')
url='http://www.sonarqube.org/'
license=('LGPL3')
depends=('java-runtime>=7')
conflicts=('sonar' 'sonarqube')
options=('!strip')
install=sonarqube-lts.install
source=('http://downloads.sonarsource.com/sonarqube/sonarqube-4.5.4.zip'
        'sonarqube.service'
        'sonar.sh.patch')
md5sums=('59c454a0fa62fe1fe6c269616770b288'
         'e98cb43f4f6b9af33312fa1d8aba88e3'
         '2b443049eede589adc4ad451197f1c10')

prepare() {
	cd ${srcdir}

	# Customize .service for $CARCH
	if [ $CARCH = 'x86_64' ]; then
		sed -i 's/ARCH/linux-x86-64/g' sonarqube.service
	else
		sed -i '/s/ARCH/linux-x86-32/g' sonarqube.service
	fi

	cd sonarqube-${pkgver}


	cd bin
		# Delete unneeded binaries
		rm -rf linux-ppc-64 macosx-universal-64 solaris* windows*

		if [ $CARCH = 'x86_64' ]; then
			patch linux-x86-64/sonar.sh < "${srcdir}/sonar.sh.patch"
			rm -rf linux-x86-32
		else
			patch linux-x86-32/sonar.sh < "${srcdir}/sonar.sh.patch"
			rm -rf linux-x86-64
		fi
	cd ..

	# Fix EOL in configuration files
	for i in conf/* ; do
		awk '{ sub("\r$", ""); print }' $i > $i.new
		mv $i.new $i
	done
}

package() {
	cd "${srcdir}"

	install -Dm644 sonarqube.service "${pkgdir}/usr/lib/systemd/system/sonarqube.service"

	cd sonarqube-${pkgver}
	install -d "${pkgdir}/opt/sonarqube"
	cp -r * "${pkgdir}/opt/sonarqube/"
	mkdir "${pkgdir}/opt/sonarqube/run"
}

