# Maintainer: kumen

pkgname=stm32cubemonucpd
_pkgname=STM32CubeMonUCPD
_pkg_file_name=en.stm32cubemonucpd-lin.zip
pkgver=1.4.0
pkgrel=3
pkgdesc="Monitoring and configuration software tool for STM32 USB-C and Power Delivery 3.0 applications"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonucpd.html"
license=('custom:SLA0048')
depends=('stlink')
#depends=('java-runtime=8' 'java8-openjfx')
options=('!strip')

# Extract actual direct download link */
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonucpd/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
_curl_req="$(curl -s --compressed --cookie-jar "${srcdir}http_cookies" -H "@${srcdir}http_headers" "$_curl_req_url" )"

# Extract actual download link to the desired file
_pkg_url="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_pkg_url="$(awk -F'"' '{print $4}' <<< "$_pkg_url")"
_download_path="https://www.st.com""$_pkg_url"
#echo $_download_path

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              --cookie "${srcdir}http_cookies" \
              -H "@${srcdir}http_headers" \
              -o %o --compressed %u")

source=("${_pkg_file_name}"::"https://www.st.com""$_pkg_url"
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

