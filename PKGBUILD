# Maintainer:       Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer:    zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg-git
_pkgname=${pkgname%-git}
pkgver=20220809.r9.2b91f0f
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
depends=('electron20')
makedepends=('git' 'yarn' 'asar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	'bbg.sh'
	'icon.png'::'https://github.com/bbg-contributors/bbg-resources/raw/main/icon.png'
	'bbg.desktop'
	"${_pkgname}::git+${url}.git"
)
sha256sums=(
	'd42008985970863855628fe7e65b43ad3c07bf18e51b4f770a95d6aef1bb3e56'
	'SKIP'
	'f503d93639c1f4d4e050eceb11adf64d369908e5941cfdbda3af30b2f3c73d96'
	'SKIP'
)

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${_pkgname}"
	yarn install
	asar pack . app.asar
	mv app.asar ../"app-${pkgver}.asar"
}

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -Dm755 bbg.sh "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/share/${_pkgname}/app.asar"
	install -Dm644 bbg.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 icon.png "${pkgdir}/usr/share/icons/${_pkgname}.png"

	# install bbgvertype: https://github.com/bbg-contributors/bbg/blob/f3d61ce4d79680329bad4cb014c909fb86037f38/App/start.js
	echo "aur-bbg-git-misaka13514" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bbg/bbgvertype"
}
