# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili-manga-downloader-bin
_pkgname='Bilibili Manga Downloader'
_zhsname="哔哩哔哩漫画下载器"
pkgver=3.2.2
_electronversion=21
pkgrel=3
pkgdesc="Cross-platform Bilibili manga downloader based on modern GUI (supports bonus downloads)(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/MOMOYATW/bilibili_manga_downloader"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MOMOYATW/bilibili_manga_downloader/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('841cc1c8310d8d83d73ddab34864869e4b74c69f5a35bbbc8fb9a5d668ebd815'
            '9d60cfeddb5c57bfa82b7ece15cc0b270badb5d00cbfbf4d66945a77ee28e662'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    asar e "${srcdir}/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/app" -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/linux-unpacked/resources/"{app.asar.unpacked,static}  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/linux-unpacked/resources/static/icon-64.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}