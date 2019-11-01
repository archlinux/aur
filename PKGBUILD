# Maintainer: davedatum <ask at davedatum dot com>

pkgname=cabal-desktop-git
_pkgname=cabal-desktop
pkgver=3.1.1.r11.g23e1c10
pkgrel=1
pkgdesc="Desktop client for Cabal, the p2p/decentralized/local-first chat platform."
arch=("x86_64")
url="https://github.com/cabal-club/cabal-desktop"
license=("AGPL3")
depends=("electron")
makedepends=("git" "npm" "libicns" "imagemagick")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${_pkgname}.install
source=("${_pkgname}::git+$url.git#commit=23e1c107792cfb4c5205d3acdb28a95b8a43cad5"
		"${_pkgname}.sh"
		"${_pkgname}.desktop"
		"${_pkgname}.install")
md5sums=('SKIP'
         '8244c7f8e70a73dc0de4beb09e6d06e7'
         'f0b11be2a1061cbe541c2287b3eb0926'
         'a5f7c97e76cc1fda971109a050cb6a02')

prepare() {
    sed -i -e '/"scripts": {/a "linux": "npm run build && electron-builder --dir",' "$srcdir/$_pkgname/package.json"
    icns2png -x -s 1024 "${srcdir}/${_pkgname}/build/icon.icns" -o \
      "${srcdir}/${_pkgname}/build/"
}

pkgver() {
  	cd "${_pkgname}"
  	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	npm install && npm run linux
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${_pkgname}/app.asar"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
      install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
      convert "${srcdir}/${_pkgname}/build/*.png" \
      -resize "$_size" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done
}