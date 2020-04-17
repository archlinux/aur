# Maintainer: Eric Langlois <eric@langlois.xyz>

pkgname=spacechem-hib
_installname=spacechem
pkgver=1013
pkgrel=1
epoch=2
pkgdesc="A design-based puzzle game from Zachtronics Industries. Humble Bundle version."
license=('custom')
arch=('x86_64')
url="http://www.zachtronics.com/spacechem/"
depends=('sdl' 'sdl_image' 'sdl_mixer' 'mono' 'xclip')
optdepends=('lib32-glibc: Recording runs via rgb2theora')
provides=('spacechem')
conflicts=('spacechem' 'gog-spacechem')
_gamepkg="SpaceChem_Linux_v${pkgver}_FIXED.zip"

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
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("${_gamepkg}"::"hib://${_gamepkg}"
        "${pkgname}.desktop"
        "${pkgname}.patch")
md5sums=('c290e8631ae3380b7e70362501a5adb6'
         '9a436b55222c47c0c03060de4043d8a1'
         'c8f74f821035d5daaff6c61ec643ae51')
options=(!strip)

prepare() {
	cd "SpaceChem"
	patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

package() {
	cd "SpaceChem"
	find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/${_installname}/{}" \;
	chmod 755 "${pkgdir}/opt/${_installname}"/{rgb2theora,spacechem-launcher.sh}

	install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_installname}.png"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_installname}" readme/*

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_installname}/spacechem-launcher.sh" "${pkgdir}/usr/bin/${_installname}"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
}
