# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: James Groom <OSSYoshiRulz at gmail dot com>

pkgname="bizhawk-bin"
pkgdesc="A multi-platform emulator with full re-recording support and Lua scripting"

pkgver=2.9.1
pkgrel=1

arch=(x86_64)

url="https://tasvideos.org/BizHawk"
license=("LicenseRef-BizHawk" "MIT")

depends=(glibc mono openal "lua>=5.4" lsb-release)
makedepends=(gendesk icoutils)

provides=(bizhawk)

source=(
	"https://github.com/TASEmulators/BizHawk/releases/download/${pkgver}/BizHawk-${pkgver}-linux-x64.tar.gz"
	"https://raw.githubusercontent.com/TASEmulators/BizHawk/${pkgver}/LICENSE"
)
md5sums=("9571112b79920833824f0033a7038246" "2d15d8df1b4ec039a8fac3202a418a3c")

prepare() {
	# extract the icon out of the executable
	wrestool -x -R -n 6 EmuHawk.exe -o logo.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname BizHawk \
		--pkgdesc "${pkgdesc}" \
		--exec bizhawk \
		--icon bizhawk.png \
		--categories "Game;Emulator"
}

package() {
	# copy all files to the package directory
	find . -type d -exec install -Dm775 -ggames -d "${pkgdir}/opt/bizhawk/{}" \;
	find . -type f \
		-regextype egrep -not -regex "./(EmuHawkMono.sh|BizHawk.desktop|logo.png|LICENSE)" \
		-exec install -Dm664 -ggames "{}" "${pkgdir}/opt/bizhawk/{}" \;

	install -Dm774 -ggames EmuHawkMono.sh "${pkgdir}/opt/bizhawk/EmuHawkMono.sh"

	# copy the icon and the .desktop file
	install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/bizhawk.png"
	install -Dm644 BizHawk.desktop "${pkgdir}/usr/share/applications/bizhawk.desktop"

	# create a symlink to the executable
	mkdir -p "${pkgdir}/usr/bin" && ln -s /opt/bizhawk/EmuHawkMono.sh "${pkgdir}/usr/bin/bizhawk"

	# copy the license file
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}