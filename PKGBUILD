# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=live-luckdraw
pkgname="bili-${_appname//-/}-bin"
_pkgname=Bili-LiveLuckDraw
pkgver=1.0.5
_electronversion=35
pkgrel=1
pkgdesc="A Bilibili live streaming lottery tool that conducts lotteries by obtaining keywords from danmaku, built using Electron + React + Vite.(Prebuilt version.Use system-wide electron)一个B站直播抽奖工具，通过获取弹幕关键词进行抽奖"
arch=('x86_64')
url="https://github.com/grtsinry43/Bili-LiveLuckDraw"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-v${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/grtsinry43/Bili-LiveLuckDraw/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('949d1a151f949307eafabe70694f6edd6d131d7cd2ec2d35d3e366f9dc461883'
            '3526e8db0cbaceb54450ee1c34745daa88e43e82a33d959da40465288f3ea4fb'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    rm -rf \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*} \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/utf-8-validate/prebuilds/"{darwin-*,win32-*}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${_appname}.png" "${pkgdir}/usr/share/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}