# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.5.4
pkgrel=1
pkgdesc="Galgame Editing. Redefined | 视觉小说编辑，再进化"
arch=(
    "aarch64"
    "x86_64"
)
url="https://docs.openwebgal.com/guide/"
_ghurl="https://github.com/MakinoharaShoko/WebGAL_Terre"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'nss'
    'libxext'
    'java-runtime'
    'alsa-lib'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '227985f39b13b807400acaeaeff077939e3cd3583ddb4e25eefd35d6a615b62a')
sha256sums_aarch64=('709b7bd8e5179adc0604420e512f7571f8e61d7cb3e356cb8e7ff6d8aea9b169')
sha256sums_x86_64=('b13b2e7069b01c3e21a396db41dfda630640e8ac8e6bbbbd915032c8b92b7bb6')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Game" --name="${_appname//_/ }" --exec="${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/release/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}