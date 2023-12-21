# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fotograph-bin
_appname=Fotograph
pkgver=0.1.0_alpha
_electronversion=23
pkgrel=7
pkgdesc="A cross platform image manipulation desktop application"
arch=("x86_64")
url="https://fotograph.vercel.app/"
_ghurl="https://github.com/Adedoyin-Emmanuel/FotoGraph"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}_1.0.0_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('6c92bb3b3e160abf34bbd8a73e844792a679558ec37ab38a6dad9919e211278f'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}