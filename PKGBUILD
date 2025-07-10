# Maintainer: kumen
# Contributor: nightuser <nightuser.android@gmail.com>

pkgname="stm32cubeide"
pkgver=1.19.0
_pkgver_ext=1.19.0_25607_20250703_0907
_pkg_file_name=st-stm32cubeide_1.19.0_25607_20250703_0907_amd64.sh.zip
pkgrel=2
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
makedepends=('imagemagick')
depends=('glibc' 'libusb' 'ncurses5-compat-libs' 'webkit2gtk' 'stlink-server')
optdepends=('jlink-software-and-documentation' 'stlink' 'arm-none-eabi-gdb')
conflicts=()
url="https://www.st.com/en/development-tools/stm32cubeide.html"
license=('custom:SLA0048')
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
	"99-jlink.rules.patch"
	"https://www.st.com/resource/en/license_agreement/dm00218346.pdf"
	"https://www.st.com/resource/en/additional_license_terms/additional-license-terms-stm32cubeide-v${pkgver//./-}.html"
	"http_headers"
	"stm32cubeide.desktop"
	"stm32cubeide"
	"stm32cubeide_wayland"
	)
sha256sums=('fa3797bfbfb2c11860400225eda1429d1ce16d52593e55ba2480af18b69c3c6d'
	'0f3f69f7c980a701bf814e94595f5acb51a5d91be76b74e5b632220cfb0e7bb3'
	'SKIP'
	'SKIP'
	'4fc6f177425adbd491cbb7326969a4e77a78588c30e674a1e3455981ad523c40'
	'48849f72574f043c0d2d0132750f7bc0a95f14c89ff74e10ba2bc34b0a081103'
	'59063401ec21ed8a88cfebbc71328331165108919758a2655454bb00dfdf174f'
	'accaaa9d5e9bdac89418fcb0bfdb7c9c76c4faa58ccb70b32137864808fa9984'
)

prepare(){
	mkdir -p build
	sh "${srcdir}/"st-stm32cubeide_${_pkgver_ext}_amd64.sh --quiet --noexec --nox11 --target "${srcdir}/build"

	mkdir -p "${srcdir}/build/stlink-server"
	sh "${srcdir}/build/"st-stlink-server.*.install.sh --quiet --noexec --nox11 --target "${srcdir}/build/stlink-server"

	mkdir -p "${srcdir}/build/stlink-udev"
	sh "${srcdir}/build/"st-stlink-udev-rules-*-linux-noarch.sh --quiet --noexec --nox11 --target "${srcdir}/build/stlink-udev"

	mkdir -p "${srcdir}/build/jlink-udev"
	sh "${srcdir}/build/"segger-jlink-udev-rules-*-linux-noarch.sh --quiet --noexec --nox11 --target "${srcdir}/build/jlink-udev"
}

package() {
	cd "$srcdir"

	msg2 'Installing STM32CubeIDE'
	install -dm 755 "${pkgdir}/opt/${pkgname}"
	tar zxf "./build/st-stm32cubeide_${_pkgver_ext}_amd64.tar.gz" -C "${pkgdir}/opt/${pkgname}"

	msg2 'Installation of STlink server skipped'
	#msg2 'Installing STlink server'
	#install -dm 755 "${pkgdir}/usr/bin/"
	#install -Dm 755 -o root -g root "${srcdir}/build/stlink-server/stlink-server" "${pkgdir}/usr/bin/"

	msg2 'Installation of STlink udev rules skipped'
	#msg2 'Installing STlink udev rules'
	#install -dm 755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -Dm 644 -o root -g root "$srcdir/build/stlink-udev/"*.rules "${pkgdir}/usr/lib/udev/rules.d/"

	msg2 'Installation of JLink udev rules skipped'
	#msg2 'Installing JLink udev rules'
	#install -dm 755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -Dm 644 -o root -g root "$srcdir/build/jlink-udev/"*.rules "${pkgdir}/usr/lib/udev/rules.d/" 
	#patch -i "${srcdir}/99-jlink.rules.patch" "${pkgdir}/usr/lib/udev/rules.d/99-jlink.rules"

	msg2 'Installation of binary files'
	install -dm 755 "${pkgdir}/usr/bin/"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 755 "${srcdir}/${pkgname}_wayland" "${pkgdir}/usr/bin/${pkgname}_wayland"

	msg2 'Installing desktop shortcut and icon'
	magick "${pkgdir}/opt/${pkgname}/icon.xpm" "${srcdir}/${pkgname}.png"
	install -dm 755 "${pkgdir}/usr/share/pixmaps/"
	install -dm 755 "${pkgdir}/usr/share/applications/"
	install -Dm 644 "${srcdir}/${pkgname}.png" 	"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" 	"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	#msg2 'Replace GDB by system'
	#rm "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin/arm-none-eabi-gdb
	#rm "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin/arm-none-eabi-gdb-add-index
	#ln -s /usr/bin/arm-none-eabi-gdb "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin
	#ln -s /usr/bin/arm-none-eabi-gdb-add-index "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin
	
	msg2 'Create symlink from original directory name'
	read -r default_install_path < "${srcdir}/build/default_install_path.txt"
	install -dm 755  "${pkgdir}/opt/st/"
	ln -s "/opt/${pkgname}" "${pkgdir}${default_install_path}"
	
	msg2 'Installation of license file'
	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm 644 -o root -g root "${srcdir}/dm00218346.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm 644 -o root -g root "${srcdir}/additional-license-terms-stm32cubeide-v${pkgver//./-}.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
