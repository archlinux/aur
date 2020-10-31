# Maintainer: Eric Langlois <eric@langlois.xyz>

pkgname=spacechem-hib
_installname=spacechem
pkgver=1016
pkgrel=1
epoch=2
pkgdesc="A design-based puzzle game from Zachtronics Industries. Humble Bundle version."
license=('custom')
arch=('x86_64')
url="http://www.zachtronics.com/spacechem/"
depends=()
provides=('spacechem')
conflicts=('spacechem' 'gog-spacechem')
_gamepkg="SpaceChem_Linux_v${pkgver}.zip"

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=("hib::/usr/bin/echo \"Could not find %u. Download manually to '$(pwd)' or setup hib:// DLAGENT in /etc/makepkg.conf.\"")

source=("${_gamepkg}"::"hib://${_gamepkg}"
        "${pkgname}.desktop")
md5sums=('c4500639c8c48f898e0a8060af31b075'
         '86bf2f4d344da8883e85959a2cd42694')
options=(!strip)

package() {
	cd "SpaceChem"
	find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/${_installname}/{}" \;
	chmod 755 "${pkgdir}/opt/${_installname}/"{rgb2theora,SpaceChem}

	install -Dm644 images/icon.png "${pkgdir}/usr/share/pixmaps/${_installname}.png"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_installname}" LICENSE.txt

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_installname}/SpaceChem" "${pkgdir}/usr/bin/${_installname}"

	install -Dm644 "${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_installname}.desktop"
}
