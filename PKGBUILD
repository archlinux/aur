# Maintainer: kumen

pkgname=stm32cubemonucpd
_pkgname=STM32CubeMonUCPD
_pkg_file_name=en.STM32CubeMonUCPD_Lin.zip
pkgver=1.3.0
pkgrel=1
pkgdesc="Monitoring and configuration software tool for STM32 USB-C and Power Delivery 3.0 applications"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonucpd.html"
license=('custom:SLA0048')
# package stlink provides stlink udev files
depends=('java-runtime=8' 'java8-openjfx')
options=('!strip')

# cURL inspiration from davinci-resolve package maintained by "Alex S".
_curl_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"
_curl_useragent="$(printf '%s' "$_curl_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_curl_useragent// /\\ }"
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonucpd/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed -H "$_curl_useragent" "$_curl_req_url")"
_curl_req="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_download_path="https://www.st.com""$(awk -F'"' '{print $4}' <<< "$_curl_req")"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H ${_useragent_escaped} \
              -o %o --compressed %u")
              
   
source=("${_pkg_file_name}"::"$_download_path")
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

export PATH="/usr/lib/jvm/java-8-openjdk/bin/:\$PATH"
exec java -jar /opt/${pkgname}/STM32CubeMonitor-UCPD.jar "$@"
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

	msg2 'Removing bundled JRE'
	rm "${pkgdir}/opt/${pkgname}/jre" -R
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

