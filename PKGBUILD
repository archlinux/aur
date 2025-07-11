# Maintainer: yjun <jerrysteve1101@gmail.com>
# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: GPereira <goncalo_pereira@outlook.pt>
# Maintainer: CloverGit <clovergit@hotmail.com>

# forked from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=stm32cubeide

pkgname=stm32cubeprog
_pkgname="STM32CubeProgrammer"
pkgver=2.20.0
pkgrel=1
pkgdesc="An all-in-one multi-OS software tool for programming STM32 products."
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubeprog.html"
license=('custom:SLA0048')
# libusb1.0.12 version or higher is required to run STM32CubeProgrammer.

#
# There is no need to install any Java™ SE Run Time Environment since version 2.6.0. The
# STM32CubeProgrammer runs with a bundled JRE available inside the downloaded
# package and no longer with the one installed on your machine.

# -------------------------------------------------->
# https://www.st.com/resource/en/user_manual/dm00403500-stm32cubeprogrammer-software-description-stmicroelectronics.pdf
#
# stlink provides stlink udev rules
depends=('stlink'
	'libusb'
	'qt6-serialport')

makedepends=('icoutils'
	'gendesk'
	'gsfonts'
	'p7zip'
	'java-environment=8')

provides=("${pkgname}rammer")
options=('!strip'
	'!debug')

# Big thanks to user "yjun" for direct download link advice.
# cURL inspiration from davinci-resolve package maintained by "Alex S".
_pkg_file_name="en.stm32cubeprg-lin-v${pkgver//./-}.zip"
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-programmers/stm32cubeprog/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed --cookie-jar "${srcdir}http_cookies" -H "@${srcdir}http_headers" "${_curl_req_url}")"
_pkg_url="$(grep -m 1 "${_pkg_file_name}" <<<"${_curl_req}")"
_pkg_url="$(awk -F'"' '{print $4}' <<<"${_pkg_url}")"
_download_path="https://www.st.com""${_pkg_url}"
DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              --cookie "${srcdir}http_cookies" \
              -H "@${srcdir}http_headers" \
              -o %o --compressed %u")
# msg "_download_path = ${_download_path}"
# msg "DLAGENTS = ${DLAGENTS}"

source=("${_pkg_file_name}::$_download_path"
	"http_headers"
	"AnalyticsPanelsConsoleHelper.java"
	"CheckedHelloPorgrammerPanelConsoleHelper.java"
	"FinishProgrammerPanelConsoleHelper.java"
	"TargetProgrammerPanelConsoleHelper.java"
	"SLA0048_STM32CubeProg.pdf")

sha256sums=('5fe26a9350c0c72c3b4a87aa3012fdeb6cfb0952b3e0fc05ba84f049f2f1401e'
            '4fc6f177425adbd491cbb7326969a4e77a78588c30e674a1e3455981ad523c40'
            '12f3f8a3301d6f50c00195f9c852e25f8d841246768bf3bbfd4e91fd2052ce6e'
            '8775375cfd21848eafb92bc11712b2d797bbec4f0109e728c175c4abb014131c'
            'd67e0fe0e16cb6f8e1f01f324a348484f38805fdbb48780788607f53b2e46901'
            '95a6ee378bb3d2b6bea9284d930a58af43db825ec22c89e5617af9b9ec959890'
            'c6d92c00dee63e0f4a54d8ea62f82a646243c3e1480142ae3e7f4ca5d77d5702')

prepare() {
	chmod u+x Setup${_pkgname}-${pkgver}.linux

	# devtools test failed： javac --release 8
	javac -cp "Setup${_pkgname}-${pkgver}.exe" -d . \
		AnalyticsPanelsConsoleHelper.java \
		CheckedHelloPorgrammerPanelConsoleHelper.java \
		TargetProgrammerPanelConsoleHelper.java \
		FinishProgrammerPanelConsoleHelper.java

	7z a Setup${_pkgname}-${pkgver}.exe \
		com/st/CustomPanels/AnalyticsPanelsConsoleHelper.class \
		com/st/CustomPanels/CheckedHelloPorgrammerPanelConsoleHelper.class \
		com/st/CustomPanels/TargetProgrammerPanelConsoleHelper.class \
		com/st/CustomPanels/FinishProgrammerPanelConsoleHelper.class

	gendesk -f -n \
		--pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--path "/opt/${pkgname}/bin" \
		--name "${_pkgname}" \
		--exec "/opt/${pkgname}/bin/${_pkgname}" \
		--icon "${pkgname}" \
		--categories "Development"
}

build() {
	mkdir -p build

	java -DINSTALL_PATH=${srcdir}/build -jar ./SetupSTM32CubeProgrammer-${pkgver}.exe -options-system

	# convert ico to icon
	mkdir -p icon
	icotool -x ${srcdir}/build/util/Programmer.ico -o icon
}

package() {
	install -dm755 ${pkgdir}/opt/${pkgname}
	cp -a ${srcdir}/build/* ${pkgdir}/opt/${pkgname}

	# icon
	index=0
	for size in 256 128 64 48 32 24 16; do
		index=$((index + 1))
		install -Dm644 ${srcdir}/icon/Programmer_${index}_${size}x${size}x32.png \
			${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
	done

	# documentation
	install -Dm644 ${pkgdir}/opt/${pkgname}/doc/Readme.txt -t ${pkgdir}/usr/share/doc/${pkgname}
	install -Dm644 ${pkgdir}/opt/${pkgname}/doc/license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/SLA0048_STM32CubeProg.pdf -t ${pkgdir}/usr/share/licenses/${pkgname}

	# desktop entry
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# soft link
	install -dm755 ${pkgdir}/usr/bin
	for _cmd in ${_pkgname} STM32_Programmer_CLI STM32_Programmer.sh STM32MP_SigningTool_CLI STM32MP_KeyGen_CLI; do
		ln -sf /opt/${pkgname}/bin/${_cmd} ${pkgdir}/usr/bin/${_cmd}
	done

	# remove updater
	rm -rf ${pkgdir}/opt/${pkgname}/updater
}
# vim: set sw=2 ts=2 et:
