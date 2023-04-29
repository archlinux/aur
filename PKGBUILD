# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=spflashtool
pkgname="${_pkgname}-bin"
pkgver="6.2228"
pkgrel=1
pkgdesc="SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone."
arch=('x86_64')
url="http://spflashtools.com/category/linux"
license=('unknown')
depends=('gcc-libs' 'qt5-serialport' 'qt5-xmlpatterns')
makedepends=('gendesk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://spflashtools.com/wp-content/uploads/SP_Flash_Tool_v${pkgver}_Linux.zip"
        'spflashtool.png'
        '60-spflashtool.rules')
sha256sums=('1f063c41bb199e39e0b22082a0a369f3078e2fcd048af7aba02f0d9b5d06ba64'
            'fe0b9c1de77c687623bfc07733041d1387f755493cdf904e6afcb47f784d34c7'
            'a0e20dea13cfc63a92444e3763c764701162cfb5a8d04092dc69169f4214fb8d')

# Workaround for source file download, which requires the 'Referer' header to be set
DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u -e %u'
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
		echo 'exec /opt/'"${_pkgname}"'/SPFlashToolV6 "${@}"'
	} > "${srcdir}/${_pkgname}"
}

package() {
	local folderName="SP_Flash_Tool_v${pkgver}_Linux"

	# Clean files we do not need
	rm -r "${srcdir}/${folderName}/Driver"
	rm -r "${srcdir}/${folderName}/lib"
	rm -r "${srcdir}/${folderName}/plugins"
	rm "${srcdir}/${folderName}/99-ttyacms.rules"
	rm "${srcdir}/${folderName}/modemmanagercmd.sh"
	rm "${srcdir}/${folderName}/SPFlashToolV6.sh"

	# Install remaining files
	install -Dm644 -t "${pkgdir}/opt/${_pkgname}/" "${srcdir}/${folderName}/"*

	# Mark the binary as executable and install the shell file created in prepare()
	chmod 755 "${pkgdir}/opt/${_pkgname}/SPFlashToolV6"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file and icon
	install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Udev rule
	install -Dm644 "${srcdir}/60-${_pkgname}.rules" "${pkgdir}/usr/lib/udev/rules.d/60-${_pkgname}.rules"
}
