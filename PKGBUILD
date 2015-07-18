# Maintainer: Stefan Seering <stefanarch@gmx.de>
_pkgname_whithout_prefix=dustforce-dx
pkgname=gog-${_pkgname_whithout_prefix}
pkgver=1.2.0.4
pkgrel=1
pkgdesc='A fast-paced 2D action platforming game. As an acrobatic janitor, you are an adept force against dust and disorder. Leap and dash off walls and ceilings, and deftly traverse precarious environments. GOG Version. Linux native.'
arch=('i686' 'x86_64')
license=('custom')
url='https://www.gog.com/game/dustforce_dx'
depends=('mesa' 'libgl' 'sdl2' 'libxdamage' 'libidn' 'libvorbis' 'libxft' 'xdg-utils' 'curl' 'openal')
source=('gog://gog_dustforce_dx_1.2.0.4.tar.gz')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\" from https://www.gog.com/")
sha256sums=('0f8225af92fa797738d04e288863c23ca625acda72ac25cfd0a1eef064e205d4')

package() {
	cd -- "${srcdir}/Dustforce DX"
	rm -R -- game/lib game/lib64 # do use system libraries instead of the ones shipped with the game

	mkdir -p -- "${pkgdir}/usr/share/pixmaps"
	mv -- 'support/gog-dustforce-dx.png' "${pkgdir}/usr/share/pixmaps"

	mkdir -p -- "${pkgdir}/usr/share/applications"
	sed -i "s/Exec=gog-dustforce-dx/Exec=${_pkgname_whithout_prefix}/" -- 'support/gog-dustforce-dx-primary.desktop'
	mv -- 'support/gog-dustforce-dx-primary.desktop' "${pkgdir}/usr/share/applications/${_pkgname_whithout_prefix}.desktop"

	mkdir -p -- "${pkgdir}/usr/bin"
	ln -s -- "/opt/gog/${_pkgname_whithout_prefix}/start.sh" "${pkgdir}/usr/bin/${_pkgname_whithout_prefix}"

	mkdir -p -- "${pkgdir}/opt/gog/${_pkgname_whithout_prefix}"
	sed -i -e '12 cdeclare -r CURRENT_DIR=/opt/gog/dustforce-dx' start.sh # the original start.sh wouldn't find the correct current dir if called via a symlink
	cp -- start.sh "${pkgdir}/opt/gog/${_pkgname_whithout_prefix}"
	cp -R -- support "${pkgdir}/opt/gog/${_pkgname_whithout_prefix}"
	cp -R -- game "${pkgdir}/opt/gog/${_pkgname_whithout_prefix}"
	cp -R -- docs "${pkgdir}/opt/gog/${_pkgname_whithout_prefix}"
}

