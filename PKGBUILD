# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix-git
pkgver=0.9.20.r1537722993.ca86cbc0
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/SimonN/lix-unstable.git")
sha512sums=('SKIP')

pkgver()
{
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
	cd "${pkgname%-git}" || exit
	(
		set -o pipefail
		
		# version with unix committer date to bypass git squashes
		printf "%s.r%s.%s" \
			"$(< src/net/version.d sed -rn 's/.*_gameVersion = Version\(([0-9]+), ([0-9]+), ([0-9]+)\).*/\1.\2.\3/p')" \
			"$(git show -s --format=%ct HEAD)" \
			"$(git rev-parse --short HEAD)"
	)
}

_pkgname=${pkgname%-git}
# template start; name=lix; version=0.9;
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
depends=('allegro' 'enet' 'hicolor-icon-theme')
makedepends=('git' 'dmd' 'dub')
_dub_versions=(	'4.0.3+5.2.0' 	# Allegro
				'0.7.1'			# Bolts
				'2.0.0'			# Derelict-Enet
				'2.1.0'			# Derelict-Util
				'0.4.2'			# Enumap
				'0.6.3'			# Optional
				'0.7.1')		# Silly
			
# let makepkg handle dub packages
# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules
source+=(	"${_pkgname}-music-1.zip::http://www.lixgame.com/dow/lix-music.zip"
			"${_pkgname}.desktop"
			"allegro::git+https://github.com/SiegeLord/DAllegro5.git" #tag=v${_dub_versions[0]}"
			"bolts::git+https://github.com/aliak00/bolts.git#tag=v${_dub_versions[1]}"
			"derelict-enet::git+https://github.com/DerelictOrg/DerelictENet.git#tag=v${_dub_versions[2]}"
			"derelict-util::git+https://github.com/DerelictOrg/DerelictUtil.git#tag=v${_dub_versions[3]}"
			"enumap::git+https://github.com/rcorre/enumap.git" #tag=v${_dub_versions[4]}"
			"optional::git+https://github.com/aliak00/optional.git#tag=v${_dub_versions[5]}"
			"silly::git+https://github.com/ohdatboi/silly.git" #tag=v${_dub_versions[6]}"
		)
sha512sums+=(	'37349c98b739ea43c25137dd03865f1c9c41eec91e5edc109afd9d50ce3871bd0c7f63c3f3599a47bb4ef52f5bfd14e034010de0ac2aec5a9c0c83eaf0b89425'
				'52d49562cd9be4eec76b464153af1cce2211fdbd6113a6a60df042f7e8f7e6a8f1942df883dfaaa6c1bbfea004c4154d884dfa767e25fa3fadf9c58be1103fe6'
            	'SKIP'
				'SKIP'
				'SKIP'
				'SKIP'
				'SKIP'
				'SKIP'
				'SKIP')

build()
{
	cd "${srcdir}/${_pkgname}" || exit
	_r=0
	
	# add local dependencies to search path
	dub add-path "${srcdir}"
	
	# force FHS compatibility with '-b releaseXDG'
	# ensure with --cache=local dub stays outside the users home directory
	dub build -f -b releaseXDG --cache=local || _r="${?}"
	
	# remove local dependencies from search path so dub won't find them
	# later again
	dub remove-path "${srcdir}"
	
	# removes any cached metadata like the list of available packages 
	# and their latest version
	dub clean-caches
	
	if [[ "${_r}" != 0 ]]
	then
		# dub failed so we also fail after we removed the local dependencies
		return "${_r}"
	fi
}

check()
{
	cd "${srcdir}/${_pkgname}" || exit
	_r=0
	
	# add local dependencies to search path
	dub add-path "${srcdir}"
	
	# run test suite
	# ensure with --cache=local dub stays outside the users home directory
	dub test --cache=local || _r="${?}"
	
	# remove local dependencies from search path so dub won't find them
	# later again
	dub remove-path "${srcdir}"
	
	# removes any cached metadata like the list of available packages 
	# and their latest version
	dub clean-caches
	
	if [[ "${_r}" != 0 ]]
	then
		# dub failed so we also fail after we removed the local dependencies
		return "${_r}"
	fi
}

package()
{
	cd "${srcdir}" || exit
	
	# install application entry
	install -Dm644 \
		`# SRCFILE:` \
			"${_pkgname}.desktop" \
		`# DSTFILE:` \
			"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	
	cd "${_pkgname}" || exit
	
	# install application entry icon
	install -Dm644 \
		`# SRCFILE:` \
			"data/images/${_pkgname}_logo.svg" \
		`# DSTFILE:` \
			"${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	
	# install license text
	install -Dm644 \
		`# SRCFILE:` \
			"doc/copying.txt" \
		`# DSTFILE:` \
			"${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
		
	# install binary
	install -Dm755 \
		`# SRCFILE:` \
			"bin/${_pkgname}" \
		`# DSTFILE:` \
			"${pkgdir}/usr/bin/${_pkgname}"
	
	# remove unimportant files
	# https://raw.githubusercontent.com/SimonN/LixD/master/doc/build/package.txt
	rm -r "${srcdir}/${_pkgname}/doc/build"
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	# make directories
	mkdir -p \
		"${pkgdir}/usr/share/${_pkgname}" \
		"${pkgdir}/usr/share/doc/${_pkgname}"

	# copy documentary
	cp -dpr --no-preserve=ownership \
		`# SRCFILES:` \
			"doc/." \
		`# DSTDIR:` \
			"${pkgdir}/usr/share/doc/${_pkgname}/"
	
	# copy game files
	cp -dpr --no-preserve=ownership \
		`# SRCDIRS:` \
			"data" \
			"images" \
			"levels" \
			"${srcdir}/music" \
		`# DSTDIR:` \
			"${pkgdir}/usr/share/${_pkgname}"
}
# template end;
