# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xiguavideo-bin
_zhsname="西瓜视频"
pkgver=1.0.9
_electronversion=20
pkgrel=1
pkgdesc="XiGua Video use system-wide electron.西瓜视频Windows移植版,使用系统electron."
arch=("x86_64")
url="https://www.ixigua.com"
_dlurl="https://lf-xigua-pc.ixigua.com/obj/xigua-video-electron"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}")
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-${pkgname%-bin}"
)
noextract=("${pkgname%-bin}-${pkgver}.exe")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
    'npm'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/6922326164589517070/releases/11463809/${pkgver}/win32/xigua-video-${pkgver}-default.exe"
    LICENSE.html
    "${pkgname%-bin}.sh"
)
sha256sums=('555761bb662ca4268c737e198937de1a3ba722b44707a6f5ce605445cfaa09c2'
            'bd956769c0d43acd95075a4a95c2ffe5b31f404b4c8675c481e95d0307e82bf1'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="AudioVideo" --name="${_zhsname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/tmp"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -C "${srcdir}/tmp"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cd "${srcdir}/app.asar.unpacked"
    sed '/tron-client/d' -i package.json
    npm install
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/dist/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}