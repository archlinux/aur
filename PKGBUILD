# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>

pkgname=clonepoint-git
_pkgname=${pkgname%-git}
pkgver=r71.b40e812
pkgrel=1
pkgdesc="Free software clone of Gunpoint"
arch=('i686' 'x86_64')
url="https://rohit.itch.io/clonepoint"
license=('GPL3')
backup=("opt/${_pkgname}/config.cfg")
depends=('openal' 'sdl2' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/rohit-n/Clonepoint.git"
		"${_pkgname}_linux.tar.gz::https://drive.google.com/uc?export=download&id=0B_fe1fNijaueM1ZtdjBOcndOM0U"
		"${_pkgname}.sh"
		"${_pkgname}.desktop")
sha512sums=('SKIP'
            '261c19b4b2cf4cfcd8c568e0aa89779b754c935545e07238c737592d06c1e5828a52a3e8d62a6d51cec4c880a821da05060c86c1539f5dd982e8fcfd7f509ca3'
            '8b5ec604d5023db4f6103a7d679c4b42fc9319f59afb431b0c73718d690141553653806fbd7640b06fd1d55196b3f854507bb4383633519364b783d0ab31ebdf'
            'c925067cac3b24262a918640235152a7ff9aae121255b5e2427dc02af410dd549bcce5be96bf579d9e399ccdc3e0f6a6c3be46b2f433ffcfb6f2929639d3e929')


pkgver()
{
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
	cd "${srcdir}/${_pkgname}" || exit
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build()
{
	cd "${srcdir}/${_pkgname}" || exit
	make
}

package()
{
	cd "${srcdir}/${_pkgname}" || exit

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm666 "${srcdir}/${_pkgname}/config.cfg" "${pkgdir}/opt/${_pkgname}/config.cfg"
	install -Dm644 "${srcdir}/Clonepoint/data/backgrounds/menus/main.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	cp -dpr --no-preserve=ownership "${srcdir}/Clonepoint/data" "${pkgdir}/opt/${_pkgname}/data/"
	cp -dpr --no-preserve=ownership "${srcdir}/Clonepoint/shaders" "${pkgdir}/opt/${_pkgname}/shaders/"
}
