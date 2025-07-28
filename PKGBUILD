# Maintainer: kumen

pkgname="stmcufinder"
pkgver=6.1.0
_pkg_file_name=en.st-mcu-finderlin-v6-1-0.zip
pkgrel=5
pkgdesc="STM32 and STM8 product finder for desktops"
arch=("x86_64")
makedepends=('imagemagick')
depends=()
optdepends=("stm32cubemx")
conflicts=()
url="https://www.st.com/en/development-tools/st-mcu-finder-pc.html"
license=('Commercial')
options=(!strip)

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	msg2 ""
	msg2 "Package not found!"
	msg2 "The ${pkgname} can be downloaded here: ${url}"
	msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory (${PWD}) before build."
	msg2 ""
fi

# Download cookies
curl -s --compressed --cookie-jar "${srcdir}http_cookies" -H "@${srcdir}http_headers" "$url" > /dev/null

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              --cookie "${srcdir}http_cookies" \
              -H "@${srcdir}http_headers" \
              -o %o --compressed %u")

source=("local://${_pkg_file_name}"
	"http_headers"
	"stmcufinder.desktop"
	"stmcufinder"
	"https://www.st.com/resource/en/license_agreement/dm00218346.pdf"
	"https://www.st.com/resource/en/additional_license_terms/additional-license-tadditional-license-terms-for-st-mcu-finder-pc-v${pkgver//./-}.html")	# fix needed
sha256sums=('0d0602f3a52526e395d5bc59c074cc35e9740bd83e3cccf2a25723a8c952f0ee'
	    'e512e091ce9677a97228389c30286a8bb07abaf798026f676d5d4b7dce199410'
	    'c8fe5f9dd6f44612c4015815201746d6a9df7fd912a4dbb864cd98d3fb570faf'
	    'dfc273dbd33c2db31feb4be198f8753cee3f23e57566829f6f53263b19f9f9ad'
	    'SKIP'
	    'SKIP')
prepare(){
	install -Dm 644 /dev/stdin "${srcdir}/auto-install.xml" <<END
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
	
	msg2 'Installation of license files'
	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm 644 -o root -g root "${srcdir}/dm00218346.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm 644 -o root -g root "${srcdir}/additional-license-tadditional-license-terms-for-st-mcu-finder-pc-v${pkgver//./-}.html" "${pkgdir}/usr/share/licenses/${pkgname}/"

	msg2 'Fix folder permissions'
	chmod 755 "${pkgdir}/opt/${pkgname}/jre"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
