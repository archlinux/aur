# Maintainer: kumen
# Contributor: nightuser <nightuser.android@gmail.com>

pkgname="stm32cubeide"
pkgver=1.18.1
_pkgver_ext=1.18.1_24813_20250409_2138
_pkg_file_name=en.st-stm32cubeide_1.18.1_24813_20250409_2138_amd64.sh.zip
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

# Download file with list of URLs to files
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-ides/stm32cubeide/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
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

source=("${_pkg_file_name}"::"$_download_path"
	"99-jlink.rules.patch"
	"https://www.st.com/resource/en/license/SLA0048_STM32CubeIDE.pdf"
	"http_headers"
	"stm32cubeide.desktop"
	"stm32cubeide"
	"stm32cubeide_wayland"
	)
sha256sums=('6ac76ee6d35a0d2cbd6dc14ded0fa32f1788565c866b9dd28cba7c6250d8d54f'
	'0f3f69f7c980a701bf814e94595f5acb51a5d91be76b74e5b632220cfb0e7bb3'
	'SKIP'
	'4fc6f177425adbd491cbb7326969a4e77a78588c30e674a1e3455981ad523c40'
	'48849f72574f043c0d2d0132750f7bc0a95f14c89ff74e10ba2bc34b0a081103'
	'dc0605bac1910558b9fd3f0ecdd06bfd9d72eb3969827cba276a418a5749bcd2'
	'222265e3ccc1f8db608ca89b27768e2bf175eebafff6ad81530f46d374af12ba'
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
	install -Dm 644 -o root -g root "${srcdir}/SLA0048_STM32CubeIDE.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
