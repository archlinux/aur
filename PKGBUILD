# Maintainer: xyzzy

pkgname=spotify-adblock-git
_pkgname=${pkgname%-*}
pkgver=r68.624fad4
pkgrel=1
license=("GPL3")
pkgdesc="Adblocker for Spotify"
depends=("spotify")
makedepends=("git")
arch=("i686" "x86_64")
provides=("spotify-adblock")
conflicts=("spotify-adblock")
url=https://github.com/abba23/spotify-adblock-linux

source=(
	"${_pkgname}::git+https://github.com/abba23/spotify-adblock-linux.git"
	"cef.tar.bz2::http://opensource.spotify.com/cefbuilds/cef_binary_80.0.8%2Bgf96cd1d%2Bchromium-80.0.3987.132_linux64_minimal.tar.bz2"
	"${_pkgname}.desktop"
)
noextract=('cef.tar.bz2')

sha1sums=(
	'SKIP'
	'e6c323ff461d0f9beb093f94a77a1f817c8732e5'
	'5240cf66c7a74c2d3733cf858c9cd78e033950a5'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	bsdtar -xf ../cef.tar.bz2 --strip-components=1 '*/include'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 "../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
