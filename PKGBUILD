# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
_zhsname="小白羊云盘"
_pkgname="XBYDriver"
pkgver=3.12.5
_electronversion=21
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
provides=("aliyunpan-liupan1890")
conflicts=(
    "${pkgname%-bin}"
    "aliyunpan-liupan1890"
    "aliyunpan-odomu"
    "xbydriver"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
sha256sums_aarch64=('a5047842f75abe78837517f4de70a2ca6b262046be278b8002fc446800d7808d')
sha256sums_armv7h=('54e8c04571110e47042c0a3068fd7672dfcd4247058558f1e3829600191cbf9d')
sha256sums_x86_64=('00bfc210c1ed52ee8d732625c71109384d52448536ea2affde0efe6e57e12c3d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_zhsname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|!f.app.isPackaged|f.app.isPackaged|g" -i "${srcdir}/app.asar.unpacked/dist/electron/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/"{crx,engine,images,localVersion} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}