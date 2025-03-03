# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=video-subtitle-master-bin
_pkgname='Video Subtitle Master'
pkgver=1.8.0
_electronversion=30
pkgrel=1
pkgdesc="A powerful desktop application for batch generating subtitles for videos and translating them into other languages.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/buxuku/video-subtitle-master"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /-}_Linux_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/buxuku/video-subtitle-master/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('eb4de1759208200c22bb3ab7c56442fa2a4b0c439d6c6431631321fb674f05ff'
            '324178aaf0ebe3ab663803d3a63439cd8cdf02c3a4a40609c9ac6f8af517faed'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}