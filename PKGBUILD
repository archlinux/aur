# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas-bin
_pkgname=Commas
pkgver=0.31.0
_electronversion=29
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/CyanSalt/commas/v${pkgver}/resources/images/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('b63245a931a8d62dea49e99bad985e2124471eafc8207c5011faad86d7a0c23c'
            '65b65c25d8d68549dc271f7c755426ba8884f6ae9fb3a8061eec65c241345f48'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}