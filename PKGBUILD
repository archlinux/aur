# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix
pkgver=0.9.7
pkgrel=1
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/SimonN/LixD.git#tag=v${pkgver}"
		"${pkgname}-music-1.zip::http://www.lixgame.com/dow/lix-music.zip"
		"build_fix.patch")
sha512sums=('SKIP'
            '37349c98b739ea43c25137dd03865f1c9c41eec91e5edc109afd9d50ce3871bd0c7f63c3f3599a47bb4ef52f5bfd14e034010de0ac2aec5a9c0c83eaf0b89425'
            '44fb9d70bd517ad6e3246840de1654c8c8ad6545536528ac1bcc34c64c11b30f0984c18e6a3d5a9f96b963f644ead586b85a5c0e8ebae80cf3e2a8408471e0a0')

prepare()
{
	cd "${srcdir}"
	
	# generate .desktop-file
	gendesk -n -f --categories "Game"
	
	cd "${srcdir}/${pkgname}"
	
	# this is needed until the next release
	patch -p1 -i "${srcdir}/build_fix.patch"
}

_pkgname=${pkgname}
# template start; name=lix; version=0.4;
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
changelog=.CHANGELOG
depends=('allegro' 'enet')
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
	dub build -f -b releaseXDG --cache=local || _r=$?
	
	# remove local dependencies from search path so dub don't find them later again
	dub remove-local allegro-*/allegro
	dub remove-local derelict-enet-*/derelict-enet
	dub remove-local derelict-util-*/derelict-util
	dub remove-local enumap-*/enumap
	dub clean-caches
	
	if [[ $_r != 0 ]] ; then
		# dub failed so we also fail after we removed the local dependencies
		return $_r
	fi
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
	cp -dpr --no-preserve=ownership "data" "images" "levels" "${srcdir}/music" "${pkgdir}/usr/share/${_pkgname}"
}
# template end;
