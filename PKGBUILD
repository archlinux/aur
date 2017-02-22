# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=clonepoint-git
_pkgname=clonepoint

pkgver=r70.9c8a828
pkgrel=1
pkgdesc="Free software clone of Gunpoint"
arch=('i686' 'x86_64')
url="https://rohit.itch.io/clonepoint"
license=('GPL3')
changelog=.CHANGELOG
backup=('opt/clonepoint/config.cfg')
depends=('openal' 'sdl2')
makedepends=('git')
provides=('clonepoint')
source=(${pkgname}::git+https://github.com/rohit-n/Clonepoint.git
		'clonepoint_linux.tar.gz::https://w3g3a5v6.ssl.hwcdn.net/upload2/game/17230/142200?GoogleAccessId=507810471102@developer.gserviceaccount.com&Expires=1487779020&Signature=Vy6WEYKS1z4nvbeTPlzk57mgG55ao5fFsW9pnNH6OnRBwYhqXMUZJ1sggRTHzT6mYhAcveroDJZluapEEJoT2WeP2PQp8MzkwqOGgcgVlz2rVmB2pdtXQURlYxVTG9Ek2Wz7LpeiJSPcxqMW5GCa9SLrAimwBt1egMUMBCjOiK4=&hwexp=1487779320&hwsig=08bec548b8440e2b3e0ba63f5e34b946'
		'clonepoint.sh')
sha512sums=('SKIP'
            '261c19b4b2cf4cfcd8c568e0aa89779b754c935545e07238c737592d06c1e5828a52a3e8d62a6d51cec4c880a821da05060c86c1539f5dd982e8fcfd7f509ca3'
            '8b5ec604d5023db4f6103a7d679c4b42fc9319f59afb431b0c73718d690141553653806fbd7640b06fd1d55196b3f854507bb4383633519364b783d0ab31ebdf')


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
	git -C ${srcdir}/${pkgname} log --graph -10 > ${startdir}/.CHANGELOG
}

build()
{
	cd "$srcdir/$pkgname"
	make
}

package()
{
	cd "$srcdir/$pkgname"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/${pkgname}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	install -Dm755 "${srcdir}/clonepoint.sh" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "${srcdir}/Clonepoint/data" "${pkgdir}/opt/${_pkgname}/data/"
	cp -r "${srcdir}/Clonepoint/shaders" "${pkgdir}/opt/${_pkgname}/shaders/"
	install -Dm666 "${srcdir}/${pkgname}/config.cfg" "${pkgdir}/opt/${_pkgname}/config.cfg"
}
