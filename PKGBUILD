# Maintainer: davedatum <ask at davedatum dot com>

pkgname=cabal-desktop-git
pkgver=4.0.0.r0.g9efb32b
pkgrel=1
pkgdesc="Desktop client for Cabal, the p2p/decentralized/local-first chat platform."
arch=("x86_64")
url="https://github.com/cabal-club/cabal-desktop"
license=("AGPL3")
depends=("electron5")
makedepends=("git" "npm" "libicns" "imagemagick")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${pkgname}::git+$url.git#tag=v4.0.0"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         'a64677d2e3fc1a39ec60f6d2a3addef2'
         '8448a411c5cf2621959f7d33ce2110fb'
         'bbbc6b7a1102ca32c9ac39b47d7742de')

prepare() {
    sed -i -e '/"scripts": {/a "linux": "npm run build && electron-rebuild -f -w sodium-native && electron-builder --dir ",' \
    "$srcdir/$pkgname/package.json"

    sed -i -e '/"devDependencies": {/a "electron-rebuild": "^1.8.8",' \
    "$srcdir/$pkgname/package.json"

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

  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}/dist/linux-unpacked/resources/." "${pkgdir}/opt/${pkgname}"
  chmod -R 755 "${pkgdir}/opt/${pkgname}"

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