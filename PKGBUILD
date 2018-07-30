# Maintainer: muchweb <aleks@s-ko.net>

pkgname=tidal-music-linux-git
_pkgname=tidal-music-linux
pkgver=1.0
pkgrel=1
pkgdesc='An electron based wrapper around the Tidal web player for Linux'
arch=('x86_64')
url='https://github.com/Bunkerbewohner/tidal-music-linux'
license=('MIT')
# dunno if needed: libxtst alsa-lib gconf libnotify gtk2 nss
depends=('pepper-flash' 'nodejs' 'git' 'npm' 'electron')
provides=("${_pkgname}")
source=(
	'git+https://github.com/Bunkerbewohner/tidal-music-linux.git'
	"${_pkgname}.desktop"
	'tidal'
	'pepperflash-path.patch'
)
sha256sums=(
	'SKIP'
	'e19e840451f261f3e074da6633be787ebcbf5091b98f96d114141d2b602422fc'
	'5cf0a00a9eb28019a6126491ddfc4b5455bcd44d43be05f81544d438dface390'
	'b4e00a68ffa44ed84d76d3731ad09ded4120d464e6ad286de20df572c92f7147'
)

prepare() {
	pushd "${srcdir}/${_pkgname}"
	patch -p1 < "${srcdir}/pepperflash-path.patch"
	popd
}

build() {
	pushd "${srcdir}/${_pkgname}"
	npm install
	popd
}

package() {
	# license
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

	# source
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -v "${srcdir}/${_pkgname}/icon.png" "${pkgdir}/usr/share/${pkgname}"
	cp -v "${srcdir}/${_pkgname}/main.js" "${pkgdir}/usr/share/${pkgname}"
	cp -v "${srcdir}/${_pkgname}/index.html" "${pkgdir}/usr/share/${pkgname}"
	cp -rv "${srcdir}/${_pkgname}/node_modules" "${pkgdir}/usr/share/${pkgname}"
	cp -v "${srcdir}/${_pkgname}/preload.js" "${pkgdir}/usr/share/${pkgname}"
	cp -v "${srcdir}/${_pkgname}/style.css" "${pkgdir}/usr/share/${pkgname}"

	# bin
	mkdir -p "${pkgdir}/usr/bin"
	install -D "tidal" "${pkgdir}/usr/bin/tidal"

	# .desktop
	install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
