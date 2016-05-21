# Maintainer: Omar Pakker <omar.pakker@oracle.com>

pkgname=spflashtool-bin
_pkgname=spflashtool
pkgver="5.1520.00.100"
pkgrel=4
pkgdesc="SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone."
arch=('i686' 'x86_64')
url="http://spflashtool.com/"
license=('unknown')
depends=('qt4' 'libpng12')
makedepends=('gendesk')
provides=('spflashtool')
conflicts=('spflashtool')
changelog=
source=('spflashtool.png')
source_i686=("http://spflashtool.com/download/SP_Flash_Tool_Linux_32Bit_v${pkgver}.zip")
source_x86_64=("http://spflashtool.com/download/SP_Flash_Tool_exe_Linux_64Bit_v${pkgver}.zip")
sha256sums=('fe0b9c1de77c687623bfc07733041d1387f755493cdf904e6afcb47f784d34c7')
sha256sums_i686=('961ef389154a71db39b79b26b5ea9752ab61e1e675b27f8a55cda87414aca569')
sha256sums_x86_64=('b05e12980ee8bbde9f0682cd58222c5b870d84ab985326220f732aa475c6d495')

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
	
	# Create exec file.
	{
		echo '#!/bin/sh'
		echo 'export LD_LIBRARY_PATH="/opt/'"${_pkgname}"':/opt/'"${_pkgname}"'/lib"'
		echo '/opt/'"${_pkgname}"'/flash_tool "${@}"'
	} > "${srcdir}/${_pkgname}"
}

package() {
	local folderName=""
	
	case "$CARCH" in
		i686)
			folderName="SP_Flash_Tool_Linux_v${pkgver}"
			;;
		x86_64)
			folderName="SP_Flash_Tool_exe_Linux_v${pkgver}"
			;;
	esac
	
	install -dm755 "${pkgdir}/opt/${_pkgname}/"
	cp -dr --no-preserve=ownership "${srcdir}/${folderName}/." "${pkgdir}/opt/${_pkgname}/"
	rm "${pkgdir}/opt/${_pkgname}/flash_tool.sh"
	
	# The program executable
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	
	# Desktop file
	install -Dm644 "${srcdir}/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

