# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Karsten Pufahl <kontakt <AT> karstenpufahl.de>
pkgname=stm32cubemx
pkgver=4.19.0
pkgrel=1
epoch=
pkgdesc="graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
arch=(any)
url="http://www.st.com/content/st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-configurators-and-code-generators/stm32cubemx.html"
license=('custom')
groups=()
depends=('lib32-glibc'
	 'java-environment'
	 'bash')
makedepends=('imagemagick')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://www.st.com/content/ccc/resource/technical/software/sw_development_suite/00/22/e1/cf/b7/83/42/25/stm32cubemx.zip/files/stm32cubemx.zip/jcr:content/translations/en.stm32cubemx.zip"
	"LICENSE"
	"stm32cubemx.desktop"
	"stm32cubemx.sh")
noextract=()
sha512sums=('b02170d82909cd35354e79bd26a315a3fe9b0c69408bc0155884586d93ad3c361609a60499c687845f821dade84a13bb2e2caa95676358020d01f6a1c48439e3'
            'ad1897ea5234b712d726b5d3423f05f1c0c5a64e28354afe07dce7451563ae4492366cc252ca379b44793797be20011a66458431fd5453c18a7543ccb8df5397'
            '56bff32e35f8eb09ae4df94e4e885aaf9349c687ce9f4901ddd11c83b69a32b19d99ab8dbd90c6679e86e7213c4d41640e52ab0d80b8fc4640a1bc5df9a3af32'
            'bef2450971c152c7f45565e0e36faf1863ddc6616532d5db2f29344de5d2d34852946a89e865059a632761a0c2565177cb2181724837b7b740b0697265d307c0')
validpgpkeys=()


build() {
	cd "${srcdir}"

# generate xml file for the provided isntaller to run in non-interactive mode
cat << EOM > auto-install_custom.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
<com.st.microxplorer.install.MXHTMLHelloPanel id="readme"/>
<com.st.microxplorer.install.MXLicensePanel id="licence.panel"/>
<com.st.microxplorer.install.MXTargetPanel id="target.panel">
<installpath>$pkgdir/opt/$pkgname/</installpath>
</com.st.microxplorer.install.MXTargetPanel>
<com.st.microxplorer.install.MXShortcutPanel id="shortcut.panel"/>
<com.st.microxplorer.install.MXInstallPanel id="install.panel"/>
<com.st.microxplorer.install.MXFinishPanel id="finish.panel"/>
</AutomatedInstallation>
EOM

}

package() {
	java -jar "${srcdir}/SetupSTM32CubeMX-${pkgver}.exe" "auto-install_custom.xml"
	
	# mkdir -p "${pkgdir}/opt"

        # /usr/bin symlink
        # mkdir -p "${pkgdir}/usr/bin"
        # cd "${pkgdir}/usr/bin"
        # ln -s /opt/$pkgname/STM32CubeMX stm32cubemx
	
	install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgname}"

	#icon and desktop file
	convert "${pkgdir}/opt/stm32cubemx/help/STM32CubeMX.ico" "${srcdir}/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	#license
	install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
