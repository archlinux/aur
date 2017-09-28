# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix
pkgver=0.9.0
pkgrel=1
conflicts=("${pkgname}-git")
source=(${pkgname}::git+https://github.com/SimonN/LixD.git#tag=v${pkgver})
sha512sums=('SKIP')

prepare()
{
	cd "${srcdir}"
	
	# generate .desktop-file
	gendesk -n -f --categories "Game"
}

_pkgname=${pkgname}
# template start; name=lix; version=0.1;
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
changelog=.CHANGELOG
depends=('allegro')
makedepends=('git' 'gendesk' 'dmd' 'dub')

build()
{
	cd "${srcdir}/${_pkgname}"
	
	# force an upgrade of the dependencies to the local folder, without --cache=local they get added to the users home directory
	dub upgrade --cache=local
	
	# add local dependencies to search path
	dub add-local allegro-*/allegro
	dub add-local derelict-enet-*/derelict-enet
	dub add-local derelict-util-*/derelict-util
	dub add-local enumap-*/enumap
	
	# force FHS compatibility with '-b releaseXDG'
	dub build -f -b releaseXDG --cache=local
	
	# remove local dependencies from search path so dub don't find them later again
	dub remove-local allegro-*/allegro
	dub remove-local derelict-enet-*/derelict-enet
	dub remove-local derelict-util-*/derelict-util
	dub remove-local enumap-*/enumap
	dub clean-caches
}

package()
{
	cd "${srcdir}"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	
	cd "${_pkgname}"
	install -Dm644 "data/images/${_pkgname}_logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	install -Dm644 "doc/copying.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
	install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	mkdir -p "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -dpr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/${_pkgname}/"
	cp -dpr --no-preserve=ownership "data" "images" "levels" "${pkgdir}/usr/share/${_pkgname}"
}
# template end;
