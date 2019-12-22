pkgname=spflashtool-noqtdeps
_pkgname=spflashtool
pkgver="5.1944"
pkgrel=2
pkgdesc="SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone. (no qt dependencies)"
arch=('x86_64')
url="https://spflashtools.com/category/linux"
license=('unknown')
depends=('libpng12')
makedepends=('gendesk')
provides=('spflashtool')
conflicts=('spflashtool' 'spflashtool-bin')
source=("https://spflashtools.com/wp-content/uploads/SP_Flash_Tool_v${pkgver}_Linux.zip"
        'spflashtool.png')
sha256sums=('1a2315a3421d30f273fe822306b459604fc932fa02910bbd09af7b9dda3a01a1'
            'fe0b9c1de77c687623bfc07733041d1387f755493cdf904e6afcb47f784d34c7')

# Workaround for source file download, which requires the 'Referer' header to be set
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -e '"${url}"' -o %o %u')

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
}

package() {
	# Install files 
	mkdir -p "${pkgdir}/opt/${_pkgname}/"
	bsdtar -xf "SP_Flash_Tool_v${pkgver}_Linux.zip" -C "${pkgdir}/opt/${_pkgname}/" --strip-components=1

	# Overwrite flash_tool.sh
	echo '#!/usr/bin/env sh

execfile=$(readlink -f "$0" | sed "s/\.sh$//")
dirname=$(dirname "$execfile")

LD_LIBRARY_PATH="$dirname":"$dirname/lib"
export LD_LIBRARY_PATH

chmod +x "$execfile"
"$execfile" "$@"' \
	> "${pkgdir}/opt/${_pkgname}/flash_tool.sh"

	# Mark the binaries as executable
	chmod +x "${pkgdir}/opt/${_pkgname}/"{flash_tool,flash_tool.sh,bin/assistant}

	# Excutable in PATH
	mkdir -p "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_pkgname}/flash_tool.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file and icon
	install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Udev rule
	install -Dm644 "${pkgdir}/opt/${_pkgname}/99-ttyacms.rules" "${pkgdir}/usr/lib/udev/rules.d/99-ttyacms.rules"
	rm "${pkgdir}/opt/${_pkgname}/99-ttyacms.rules"
}
