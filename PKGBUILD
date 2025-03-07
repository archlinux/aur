# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname=hiyacfw-helper
pkgdesc="Tool for making the HiyaCFW (and TWiLightMenu++) installation process simpler"

pkgver=3.6.10
pkgrel=2

arch=(x86_64 i386)

url="https://github.com/mondul/HiyaCFW-Helper"
license=("Unlicense")

depends=(python python-certifi tk)
makedepends=(gendesk)

source=("https://github.com/mondul/HiyaCFW-Helper/releases/download/v${pkgver}/HiyaCFW-Helper-Python3.zip")
md5sums=("SKIP")

prepare() {
	# set the correct path in the script
	sed -i "s|scriptPath = .*|scriptPath = '/usr/share/hiyacfw-helper'|" HiyaCFW_Helper.py

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "hiyaCFW Helper" \
		--pkgdesc "${pkgdesc}" \
		--exec hiyacfw-helper \
		--categories "Utility"
}

package() {
	# make the required directories
	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/bin"

	# copy the included binaries
	find Linux -type f -exec install -Dm755 {} "${pkgdir}/usr/share/hiyacfw-helper/{}" \;

	# copy the main script and the .desktop file
	install -Dm755 HiyaCFW_Helper.py "${pkgdir}/usr/share/hiyacfw-helper/HiyaCFW_Helper.py"
	install -Dm644 "hiyaCFW Helper.desktop" "${pkgdir}/usr/share/applications/hiyacfw-helper.desktop"

	# make a symlink to the script
	ln -s /usr/share/hiyacfw-helper/HiyaCFW_Helper.py "${pkgdir}/usr/bin/hiyacfw-helper"
}