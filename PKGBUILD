# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: James Groom <OSSYoshiRulz at gmail dot com>

_pkgname=bizhawk
pkgname="${_pkgname}-bin"

pkgdesc="A multi-platform emulator with full re-recording support and Lua scripting"

pkgver=2.11.1
pkgrel=2

arch=(x86_64)

url="https://tasvideos.org/BizHawk"
license=("LicenseRef-BizHawk" "MIT")

depends=(glibc mono openal "lua>=5.4" lsb-release)
makedepends=(gendesk icoutils)

provides=("${_pkgname}")

source=(
	"https://github.com/TASEmulators/BizHawk/releases/download/${pkgver}/BizHawk-${pkgver}-linux-x64.tar.gz"
	"LICENSE.${_pkgname}::https://raw.githubusercontent.com/TASEmulators/BizHawk/${pkgver}/LICENSE"
)
md5sums=("788863f119bb0f713f82ef37675e92c6" "2d15d8df1b4ec039a8fac3202a418a3c")

options=(!strip !emptydirs)
install="${_pkgname}.install"

prepare() {
	# extract icon out of executable
	wrestool -x -R -n 6 "BizHawk-${pkgver}-linux-x64/EmuHawk.exe" -o icon.png

	# generate .desktop file
	gendesk -f -n \
		--pkgname BizHawk \
		--pkgdesc "${pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}.png" \
		--categories "Game;Emulator"
}

package() {
	# move to source directory
	cd "BizHawk-${pkgver}-linux-x64"

	# copy all files to package directory
	find . -type d -exec install -Dm775 -ggames -d "${pkgdir}/opt/${_pkgname}/{}" \;
	find . -type f \
		-not -name EmuHawkMono.sh \
		-exec install -Dm664 -ggames "{}" "${pkgdir}/opt/${_pkgname}/{}" \;

	install -Dm775 -ggames EmuHawkMono.sh "${pkgdir}/opt/${_pkgname}/EmuHawkMono.sh"

	# copy icon and .desktop file
	install -Dm644 ../icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 ../BizHawk.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# create symlink to executable
	mkdir -p "${pkgdir}/usr/bin" && ln -s "/opt/${_pkgname}/EmuHawkMono.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# copy license file
	install -Dm644 ../"LICENSE.${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
