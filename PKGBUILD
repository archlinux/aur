# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix-git
pkgver=r973.a2b7c3f
pkgrel=1
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
changelog=.CHANGELOG
depends=('allegro')
makedepends=('git' 'gendesk' 'dmd' 'dub')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/SimonN/LixD.git)
sha512sums=('SKIP')

pkgver()
{
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
	cd "${srcdir}/${pkgname%-git}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare()
{
	cd "${srcdir}"
	
	# generate .desktop-file
	gendesk -n -f --categories "Game"

	# update .CHANGELOG
	git -C "${srcdir}/${pkgname%-git}" log --graph -10 > "${startdir}/.CHANGELOG"
	
	cd "${pkgname%-git}"
	
	# force an upgrade of the dependencies to the local folder, without --cache=lokal they get added to the users home directory
	dub upgrade --cache=local
	
	# add local dependencies to search path
	dub add-local allegro-*/allegro
	dub add-local derelict-enet-*/derelict-enet
	dub add-local derelict-util-*/derelict-util
	dub add-local enumap-*/enumap
}

build()
{
	cd "${srcdir}/${pkgname%-git}"
	
	# force FHS compatibility with '-b releaseXDG'
	dub build -b releaseXDG --cache=local
	
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
	install -Dm644 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	
	cd "${pkgname%-git}"
	install -Dm644 "data/images/app_icon.I.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname%-git}.png"
	install -Dm644 "doc/copying.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm755 "bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	mkdir -p "${pkgdir}/usr/share/${pkgname%-git}" "${pkgdir}/usr/share/doc/${pkgname%-git}"
	cp -dpr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/${pkgname%-git}/"
	cp -dpr --no-preserve=ownership "data" "images" "levels" "${pkgdir}/usr/share/${pkgname%-git}"
}
