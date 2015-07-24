# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=opsu
pkgver=0.10.1
pkgrel=1
pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
changelog=.CHANGELOG
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'java-web-start' 'maven' 'gendesk' 'git')
provides=('opsu')
conflicts=('opsu')
source=( ${pkgname}::git://github.com/itdelatrisu/opsu.git#tag=${pkgver}
         pom.patch
         opsu.sh )
sha512sums=('SKIP'
            '72c56c8f0c647fcdbf85a32e7c4bf1a37b7176015f08402dc20b707f11c5cbb78be1da81d4a697c9d842ac28a9a0bcf1f4c8252c2a18e2ee35435cd327da683b'
            '4b065052fef55e1860a51dfa5af080930b1001e4c82cd8b3b0383bd68b239d382d788408235a7cb4fb4a1d04123a6049188a2e2c2d0e5fd08a3deb69da25fc2d')

pkgver()
{
	cd ${srcdir}/${pkgname}
	git describe --tags | sed 's/-.*//'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --pkgname ${pkgname} --pkgdesc "$pkgdesc" --name "opsu!" --exec "${pkgname}" --categories "Game"

	# update .CHANGELOG
	# git -C ${srcdir}/${pkgname} log --graph -10 0.1.0..${pkgver} > ${startdir}/.CHANGELOG

	# check for openjdk
	if [[ ! $(archlinux-java get | sed -r 's/.*(.{7})/\1/') == "openjdk" ]]; then
		msg "OpenJDK not found, using OracleJDK"

		# cut patch
		sed -e '4q' ${srcdir}/pom.patch > ${srcdir}/pom2.patch

		# patch pom.xml
		patch ${srcdir}/${pkgname}/pom.xml ${srcdir}/pom2.patch
	else
		msg "OpenJDK found, using systempath"

		# patch pom.xml
		patch ${srcdir}/${pkgname}/pom.xml ${srcdir}/pom.patch
	fi
}

build()
{
	cd ${srcdir}/${pkgname}
	mvn install -Djar
}

package()
{
	install -Dm644 ${srcdir}/${pkgname}/target/${pkgname}-${pkgver}-runnable.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 ${srcdir}/${pkgname}/res/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
