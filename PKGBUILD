# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kindle-companion-bin
_appname=Kindle-Companion
pkgver=1.0.6
_electronversion=20
pkgrel=9
pkgdesc="Kindle Companion enables readers to easily access and manage vocabulary lookups and clippings on their Amazon Kindle device"
arch=("x86_64")
url="https://saharzelo.github.io/kindle-companion/"
_ghurl="https://github.com/saharzelo/kindle-companion"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_appname}-${pkgver}.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/saharzelo/kindle-companion/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('564bc5e3eb16f9af6fc7b9727e500e9a0f4fd4ce2d040de3d0faf636df5452a3'
            '613e2910e5cda3ce6e5b878e214d955c2a34e3475e97d365fcbec5e345a06038'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_appname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}