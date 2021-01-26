# Maintainer: xyzzy

pkgname=spotify-adblock-git
_pkgname=${pkgname%-*}
pkgver=r77.0802c42
_cefver=88.1.6
_cefcommit=g4fe33a1
_chromiumver=88.0.4324.96
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
	"cef_${_cefcommit}.tar.bz2::https://cef-builds.spotifycdn.com/cef_binary_${_cefver}%2B${_cefcommit}%2Bchromium-${_chromiumver}_linux64_minimal.tar.bz2"
	"${_pkgname}.desktop"
)

noextract=("cef_${_cefcommit}.tar.bz2")

sha512sums=(
	'SKIP'
	'd67ac68a2e8ba32ae6c6d26fc872d62ae81e25c46b9dfc50eaf2790ea661d527404d0a2b187c7fa7fe2a9f9c8ee99dded77fbef0a1718158c06cd0724108d794'
	'69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	bsdtar -xf "../cef_${_cefcommit}.tar.bz2" --strip-components=1 '*/include'
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
