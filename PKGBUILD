# Maintainer: kumen

pkgname=stm32cubemonucpd
_pkgname=STM32CubeMonUCPD
_pkg_file_name=en.STM32CubeMonUCPD_Lin.zip
pkgver=1.3.0
pkgrel=2
pkgdesc="Monitoring and configuration software tool for STM32 USB-C and Power Delivery 3.0 applications"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonucpd.html"
license=('custom:SLA0048')
# package stlink provides stlink udev files
#depends=('java-runtime=8' 'java8-openjfx')
options=('!strip')

# Extract actual direct download link */
install -Dm 755 /dev/stdin "${srcdir}headers" <<END
sec-ch-ua: Chromium;v=128, Not;A=Brand;v=24, Google Chrome;v=128
sec-ch-ua-mobile: ?0
sec-ch-ua-platform: Linux
sec-fetch-dest: empty
sec-fetch-site: same-origin 
user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
END

_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonucpd/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
_curl_req="$(curl -s --compressed -H "@${srcdir}headers" "$_curl_req_url" )"

_pkg_url="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_pkg_url="$(awk -F'"' '{print $4}' <<< "$_pkg_url")"

#_download_path="https://www.st.com""$_pkg_url"
#echo $_download_path

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H "@${srcdir}headers" \
              -o %o --compressed %u")

source=("${_pkg_file_name}"::"https://www.st.com""$_pkg_url")
sha256sums=('8cf22650111ace170eb841cace7a028cad1c68a9e3ec8abab7f739c0a0f47b0a')

#prepare() {
#
#}

package() {
	java -DINSTALL_PATH=${pkgdir}/opt/${pkgname} -jar SetupSTM32CubeMonitor-UCPD.jar -options-system

	rm "${pkgdir}/opt/${pkgname}/.installationinformation"
	
	msg2 'Installing run script'
	install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh

export PATH="/opt/${pkgname}/jre/bin:\$PATH"
exec java -Djdk.gtk.version=2 -jar /opt/${pkgname}/STM32CubeMonitor-UCPD.jar "$@"
END

	msg2 'Installing desktop shortcut and icon'
	install -Dm 644 "${pkgdir}/opt/${pkgname}/util/cubeSTLinux.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=${_pkgname}
Comment=${_pkgname} ${pkgver}
GenericName=${_pkgname}
Exec=${pkgname}
Icon=${pkgname}
Path=/opt/${pkgname}/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development;Java;
END

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

