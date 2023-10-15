# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>
# Credits: Fredy García <frealgagu at gmail dot com>

pkgname=codingame-nativefier
pkgver=52.0.0
pkgrel=0
pkgdesc="CodinGame desktop app built with nativefier"
arch=("any")
url="https://www.codingame.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier")
source=(
    "${pkgname}.desktop"
    "${pkgname}.png"
)
sha256sums=(
    "5d9966528191268734d60376967ee75db869a8ca9aa0ce29720fb6fcc162b405"
    "3f9e7c051a98f9be2495351550cc14bf38df863012312da2b1434d5153f868ee"
)

build() {
    nativefier --name "CodinGame" "${url}" "${srcdir}"
}

package() {
    install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
    cp -rL "${srcdir}/CodinGame-linux-"* "${pkgdir}/opt/${pkgname}"
    chmod -R 755 "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/CodinGame" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
    done
}
