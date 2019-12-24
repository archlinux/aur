# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=spflashtool-bin
_pkgname=spflashtool
pkgver="5.1944"
pkgrel=1
pkgdesc="SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone."
arch=('x86_64')
url="http://spflashtools.com/category/linux"
license=('unknown')
depends=('qtwebkit')
makedepends=('gendesk')
provides=('spflashtool')
conflicts=('spflashtool')
source=("http://spflashtools.com/wp-content/uploads/SP_Flash_Tool_v${pkgver}_Linux.zip"
        'spflashtool.png'
        '60-spflashtool.rules')
sha256sums=('1a2315a3421d30f273fe822306b459604fc932fa02910bbd09af7b9dda3a01a1'
            'fe0b9c1de77c687623bfc07733041d1387f755493cdf904e6afcb47f784d34c7'
            'a46a4fc667cf5d6114f3757dc8dbc6cfbc27229319d48f6d78c1e026b34210da')

# Workaround for source file download, which requires the 'Referer' header to be set
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -e %u -o %o %u'
          "${DLAGENTS[@]}")

prepare() {
	# Create .desktop file.
	gendesk -f -n \
		--pkgname "${_pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--name "SP Flash Tool" \
		--genericname "Firmware Flasher" \
		--comment "MediaTek (MTK) Firmware Flasher" \
		--exec "/usr/bin/${_pkgname}" \
		--categories "System;"

	# Create exec file. Required for the binary to find its own .so files
	{
		echo '#!/bin/sh'
		echo 'export LD_LIBRARY_PATH="/opt/'"${_pkgname}"'"'
		echo '/opt/'"${_pkgname}"'/flash_tool "${@}"'
	} > "${srcdir}/${_pkgname}"
}

package() {
	local folderName="SP_Flash_Tool_v${pkgver}_Linux"

	# Clean files we do not need
	rm "${srcdir}/${folderName}/flash_tool.sh"
	rm -r "${srcdir}/${folderName}/bin"
	rm -r "${srcdir}/${folderName}/lib"
	rm -r "${srcdir}/${folderName}/plugins"

	# Install remaining files
	install -Dm644 -t "${pkgdir}/opt/${_pkgname}/" "${srcdir}/${folderName}/"*

	# Mark the binary as executable and install the shell file created in prepare()
	chmod 755 "${pkgdir}/opt/${_pkgname}/flash_tool"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file and icon
	install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Udev rule
	install -Dm644 "${srcdir}/60-${_pkgname}.rules" "${pkgdir}/usr/lib/udev/rules.d/60-${_pkgname}.rules"

	# Link QT assistant so the help menu works
	install -dm755 "${pkgdir}/opt/${_pkgname}/bin"
	ln -sf "/usr/lib/qt4/bin/assistant" "${pkgdir}/opt/${_pkgname}/bin/assistant"
}
