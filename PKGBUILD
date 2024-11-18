# Maintainer: kumen

pkgname="stmcufinder"
pkgver=6.1.0
_pkg_file_name=en.st-mcu-finderlin-v6-1-0.zip
pkgrel=1
pkgdesc="STM32 and STM8 product finder for desktops"
arch=("x86_64")
depends=()
optdepends=("stm32cubemx")
conflicts=()
url="https://www.st.com/en/development-tools/st-mcu-finder.html"
license=('Commercial')
options=(!strip)

# Download file with list of URLs to files
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-utilities/st-mcu-finder-pc/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
_curl_req="$(curl -s --compressed -H "@${srcdir}http_headers" "$_curl_req_url" )"

# Extract actual download link to the desired file
_pkg_url="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_pkg_url="$(awk -F'"' '{print $4}' <<< "$_pkg_url")"
_download_path="https://www.st.com""$_pkg_url"
#echo $_download_path

DLAGENTS=("https::/usr/bin/curl \
            -gqb '' --retry 3 --retry-delay 3 \
            -H "@${srcdir}http_headers" \
            -o %o --compressed %u")

source=("${_pkg_file_name}"::"$_download_path"
	"stmcufinder.desktop"
	"stmcufinder")
sha256sums=('0d0602f3a52526e395d5bc59c074cc35e9740bd83e3cccf2a25723a8c952f0ee'
	    'SKIP'
	    'SKIP')
prepare(){
	install -Dm 644 /dev/stdin "${srcdir}/auto-install.xml" <<END
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
	<com.izforge.izpack.panels.checkedhello.CheckedHelloPanel id="checkedhello.panel"/>
	<com.izforge.izpack.panels.licence.LicencePanel id="licence.panel"/>
	<com.st.microxplorer.install.FinderTargetPanel id="target.panel">
		<installpath>/tmp/makepkg/stmcufinder/pkg/stmcufinder/opt/stmcufinder</installpath>
	</com.st.microxplorer.install.FinderTargetPanel>
	<com.st.microxplorer.install.MXShortcutPanel id="shortcut.panel"/>
	<com.st.microxplorer.install.MXInstallPanel id="install.panel"/>
	<com.st.microxplorer.install.FinderFinishPanel id="finish.panel"/>
</AutomatedInstallation>
END
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	./SetupSTMCUFinder-${pkgver} "${srcdir}/auto-install.xml"
	
	rm ${pkgdir}/opt/${pkgname}/.installationinformation

	msg2 'Installing desktop shortcut and icon'
	magick "${pkgdir}/opt/${pkgname}/util/STMCUFinder.ico" "${srcdir}/${pkgname}.png"
	install -dm 755 "${pkgdir}/usr/share/pixmaps/"
	install -dm 755 "${pkgdir}/usr/share/applications/"
	install -Dm 644 "${srcdir}/${pkgname}.png" 	"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" 	"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	msg2 'Installation of binary files'
	install -dm 755 "${pkgdir}/usr/bin/"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/STMCUFinder"

	msg2 'Fix folder permissions'
	chmod 755 "${pkgdir}/opt/${pkgname}/jre"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
