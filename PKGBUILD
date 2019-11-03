# Maintainer: davedatum <ask at davedatum dot com>

pkgname=cabal-desktop-git
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
install=${pkgname}.install
source=("${pkgname}::git+$url.git#commit=23e1c107792cfb4c5205d3acdb28a95b8a43cad5"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         '5062bddcfedf537cc5a214f6a9bd9ced'
         '22cfec2d6fbd6f6daaa0b247c46d69b9'
         'c9f23c6410b51ca0d92c2ebba081b4d2')

prepare() {
    sed -i -e '/"scripts": {/a "linux": "npm run build && electron-builder --dir",' "$srcdir/$pkgname/package.json"
    icns2png -x -s 1024 "${srcdir}/${pkgname}/build/icon.icns" -o \
      "${srcdir}/${pkgname}/build/"
}

pkgver() {
  	cd "${pkgname}"
  	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	npm install && npm run linux
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
      install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
      convert "${srcdir}/${pkgname}/build/*.png" \
      -resize "$_size" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
    done
}