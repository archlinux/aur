# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix
pkgver=0.9.17
pkgrel=1
changelog=.CHANGELOG
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/SimonN/LixD.git#tag=v${pkgver}"
		"${pkgname}-music-1.zip::http://www.lixgame.com/dow/lix-music.zip"
		"${pkgname}.desktop")
sha512sums=('SKIP'
            '37349c98b739ea43c25137dd03865f1c9c41eec91e5edc109afd9d50ce3871bd0c7f63c3f3599a47bb4ef52f5bfd14e034010de0ac2aec5a9c0c83eaf0b89425'
            '52d49562cd9be4eec76b464153af1cce2211fdbd6113a6a60df042f7e8f7e6a8f1942df883dfaaa6c1bbfea004c4154d884dfa767e25fa3fadf9c58be1103fe6')

_pkgname=${pkgname}
# template start; name=lix; version=0.6;
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
depends=('allegro' 'enet')
makedepends=('git' 'dmd' 'dub')

build()
{
	cd "${srcdir}/${_pkgname}"
	_r=0
	
	# force an upgrade of the dependencies to the local folder, without --cache=local they get added to the users home directory
	dub upgrade --cache=local
	
	# add local dependencies to search path
	dub add-local allegro-*/allegro
	dub add-local derelict-enet-*/derelict-enet
	dub add-local derelict-util-*/derelict-util
	dub add-local enumap-*/enumap
	dub add-local optional-*/optional
	dub add-local bolts-*/bolts
	
	# force FHS compatibility with '-b releaseXDG'
	dub build -f -b releaseXDG --cache=local || _r=$?
	
	# remove local dependencies from search path so dub don't find them later again
	dub remove-local allegro-*/allegro
	dub remove-local derelict-enet-*/derelict-enet
	dub remove-local derelict-util-*/derelict-util
	dub remove-local enumap-*/enumap
	dub remove-local optional-*/optional
	dub remove-local bolts-*/bolts
	dub clean-caches
	
	if [[ "$_r" != 0 ]] ; then
		# dub failed so we also fail after we removed the local dependencies
		return "$_r";
	fi
}

check()
{
	cd "${srcdir}/${_pkgname}"
	_r=0
	
	# force an upgrade of the dependencies to the local folder, without --cache=local they get added to the users home directory
	dub upgrade --cache=local
	
	# add local dependencies to search path
	dub add-local allegro-*/allegro
	dub add-local derelict-enet-*/derelict-enet
	dub add-local derelict-util-*/derelict-util
	dub add-local enumap-*/enumap
	dub add-local optional-*/optional
	dub add-local bolts-*/bolts
	
	dub test --cache=local || _r=$?
	
	# remove local dependencies from search path so dub don't find them later again
	dub remove-local allegro-*/allegro
	dub remove-local derelict-enet-*/derelict-enet
	dub remove-local derelict-util-*/derelict-util
	dub remove-local enumap-*/enumap
	dub remove-local optional-*/optional
	dub remove-local bolts-*/bolts
	dub clean-caches
	
	if [[ "$_r" != 0 ]] ; then
		# dub failed so we also fail after we removed the local dependencies
		return "$_r"
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
