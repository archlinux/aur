# Maintainer: kumen

pkgname=stm32cubemonucpd
_pkgname=STM32CubeMonUCPD
_pkg_file_name=en.stm32cubemonucpd-lin.zip
pkgver=1.4.0
pkgrel=4
pkgdesc="Monitoring and configuration software tool for STM32 USB-C and Power Delivery 3.0 applications"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonucpd.html"
license=('custom:SLA0048')
depends=('stlink')
#depends=('java-runtime=8' 'java8-openjfx')
options=('!strip')

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	echo ""
	echo "Package not found!"
	echo "The ${pkgname} can be downloaded here: ${url}"
	echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory (${PWD}) before build."
	echo ""
fi

DLAGENTS=("https::/usr/bin/curl -gqb '' --retry 3 --retry-delay 3 -H "@${srcdir}http_headers" -o %o -L --compressed %u")

source=("local://${_pkg_file_name}"
	"http_headers"
	"stm32cubemonucpd.desktop"
	"stm32cubemonucpd")
sha256sums=('493afa45e1acda8279681e3a3d200ad748fd63313d8a4661c04d70503cf914cb'
	    '02464309a8fb333d3b9fe375e9b92ae4b1128fac3196d1187fe8daad8d184ad6'
	    'SKIP'
	    'SKIP')

package() {
	java -DINSTALL_PATH=${pkgdir}/opt/${pkgname} -jar SetupSTM32CubeMonitor-UCPD.jar -options-system

	rm "${pkgdir}/opt/${pkgname}/.installationinformation"

	msg2 'Installation of binary files'
	install -dm 755 "${pkgdir}/usr/bin/"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	msg2 'Installing desktop shortcut and icon'
	install -dm 755 "${pkgdir}/usr/share/pixmaps/"
	install -dm 755 "${pkgdir}/usr/share/applications/"
	install -Dm 644 "${pkgdir}/opt/${pkgname}/util/cubeSTLinux.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	#msg2 'Removing bundled JRE'
	#rm "${pkgdir}/opt/${pkgname}/jre" -R
	
	msg2 'Removing bundled Uninstaller'
	rm "${pkgdir}/opt/${pkgname}/Uninstaller" -R

	# soft link
	#ln -fs /opt/${pkgname}/STM32CubeMonitor-UCPD.jar ${pkgdir}/usr/bin/${pkgname}

	# license
	install -Dm644 ${pkgdir}/opt/${pkgname}/util/SLA0048* -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:

