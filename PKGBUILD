# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moekoemusic-bin
_pkgname='MoeKoe Music'
_zhsname='萌音'
pkgver=1.4.7
_electronversion=33
pkgrel=2
pkgdesc="An open-source, concise, and aesthetically pleasing third-party client for KuGou.(Prebuilt version.Use system-wide electron)一款开源简洁高颜值的酷狗第三方客户端"
arch=('x86_64')
url="https://moejue.cn/"
_ghurl="https://github.com/iAJue/MoeKoeMusic"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}_v${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iAJue/MoeKoeMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7f3745c0c00530716b93c8e5b3341cd58c4bdb0b3648f06bc40128bfcfdec1c7'
            'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
            'a342af4d5c4e93ad5b1e740d8b6cebb1ef803b396d0a62ec6e6647d23a722141')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Utility/AudioVideo/g
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/icon\.ico/icon\.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\.\.\/api/\.\/api/g
    " "${srcdir}/app.asar.unpacked/electron/appServices.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/icons" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{api,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}