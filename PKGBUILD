# Maintainer: kumen
pkgname="stmcufinder"
pkgver=6.0.0
_pkg_file_name=en.st-mcu-finderlin-v6-0-0.zip
pkgrel=1
pkgdesc="STM32 and STM8 product finder for desktops"
arch=("x86_64")
depends=('java-runtime')
optdepends=()
conflicts=()
url="https://www.st.com/en/development-tools/st-mcu-finder.html"
license=('Commercial')
options=(!strip)

# Extract actual direct download link */
_curl_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"
_curl_useragent="$(printf '%s' "$_curl_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_curl_useragent// /\\ }"
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-utilities/st-mcu-finder-pc/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed -H "$_curl_useragent" "$_curl_req_url")"
_curl_req="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_download_path="https://www.st.com""$(awk -F'"' '{print $4}' <<< "$_curl_req")"


DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H ${_useragent_escaped} \
              -o %o --compressed %u")

source=("${_pkg_file_name}"::"$_download_path")
sha256sums=('0b7de8dcbaac1608b48d110d32635ebf7c715c769218352fc1653a5a57135637')

prepare(){
	cd "$srcdir"
	cat <<EOF > auto-install.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
	<com.izforge.izpack.panels.checkedhello.CheckedHelloPanel id="checkedhello.panel"/>
	<com.izforge.izpack.panels.licence.LicencePanel id="licence.panel"/>
	<com.st.microxplorer.install.FinderTargetPanel id="target.panel">
		<installpath>${pkgdir}/opt/${pkgname}</installpath>
	</com.st.microxplorer.install.FinderTargetPanel>
	<com.st.microxplorer.install.MXShortcutPanel id="shortcut.panel"/>
	<com.st.microxplorer.install.MXInstallPanel id="install.panel"/>
	<com.st.microxplorer.install.FinderFinishPanel id="finish.panel"/>
</AutomatedInstallation>
EOF
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	./SetupSTMCUFinder-${pkgver} auto-install.xml
	
	rm ${pkgdir}/opt/${pkgname}/.installationinformation

        msg2 'Installing desktop shortcuts and icon'
	convert "${pkgdir}/opt/${pkgname}/util/STMCUFinder.ico" "${pkgdir}/opt/${pkgname}/util/STMCUFinder.png"
	install -Dm 644 "${pkgdir}/opt/${pkgname}/util/STMCUFinder.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=ST MCU Finder
Comment=ST MCU Finder 6.0.0
GenericName=ST MCU Finder
Exec=STMCUFinder %F
Icon=stmcufinder.png
Path=/opt/stmcufinder/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END

	msg2 'Instalation of binary file'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
/opt/${pkgname}/STMCUFinder "\$@"
END
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/STMCUFinder" <<END
#!/bin/sh
/opt/${pkgname}/STMCUFinder "\$@"
END

	msg2 'Fix folder permissions'
	chmod 755 "${pkgdir}/opt/${pkgname}/jre"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
