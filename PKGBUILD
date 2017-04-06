# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix-git
_pkgname=lix
pkgver=r856.524b41b
pkgrel=1
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
changelog=.CHANGELOG
install=${pkgname}.install
depends=('allegro' 'enet' 'libpng' 'zlib' 'libvorbis' 'freetype2')
makedepends=('gendesk' 'dmd' 'dub')
provides=('lix')
conflicts=('lix')
source=(${pkgname}::git://github.com/SimonN/LixD.git
	${_pkgname}-logo.png::https://www.holarse-linuxgaming.de/sites/default/files/imagecache/screenshots/2012-01-22-932/lix_with_lem.png
	${_pkgname}.sh)
sha512sums=('SKIP'
            '15cfddcdc3b97e61a32763c2410601d5579aeee0900d8175053cc098dce12dd4c3508d2f6c690f77048ebb8d5b617f86374d8e97ba0a6a166b782c177293025c'
            '82fdaa227c9a86a55a02e6f0409f39c9f72e26e956d55b593df3d7fd4c5368ce904868b1603acb1a17ea502c0d5a26586ccbae7c67bb377b204b5b0d3f5455be')

pkgver()
{
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --categories "Game"

	# update .CHANGELOG
	git -C "${srcdir}/${pkgname}" log --graph -10 > "${startdir}/.CHANGELOG"
	
	# Force an upgrade of the dependencies
	cd "${srcdir}/${pkgname}"
	dub upgrade --cache=local
	dub add-local allegro-*/allegro
	dub add-local derelict-enet-*/derelict-enet
	dub add-local derelict-util-*/derelict-util
	dub add-local enumap-*/enumap
}

build()
{
	cd "${srcdir}/${pkgname}"
	dub build -b release-nobounds --cache=local
	dub remove-local allegro-*/allegro
	dub remove-local derelict-enet-*/derelict-enet
	dub remove-local derelict-util-*/derelict-util
	dub remove-local enumap-*/enumap
}

package()
{
	install -Dm644 "${srcdir}/${pkgname}/doc/copying.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${_pkgname}-logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	
	mkdir -p "${pkgdir}/opt/${_pkgname}" "${pkgdir}/opt/${_pkgname}/replays" #"${pkgdir}/opt/${_pkgname}/data/user"
	cp -R "${srcdir}/${pkgname}/bin/" "${srcdir}/${pkgname}/data/" "${srcdir}/${pkgname}/doc/" "${srcdir}/${pkgname}/levels/" "${srcdir}/${pkgname}/images/" "${pkgdir}/opt/${_pkgname}/"
	chown :games "${pkgdir}/opt/${_pkgname}/data" "${pkgdir}/opt/${_pkgname}/levels" "${pkgdir}/opt/${_pkgname}/images" "${pkgdir}/opt/${_pkgname}/replays" #"${pkgdir}/opt/${_pkgname}/data/user"
	chmod 775 "${pkgdir}/opt/${_pkgname}/data" "${pkgdir}/opt/${_pkgname}/levels" "${pkgdir}/opt/${_pkgname}/images" "${pkgdir}/opt/${_pkgname}/replays" #"${pkgdir}/opt/${_pkgname}/data/user"
}
