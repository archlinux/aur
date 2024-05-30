# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
_zhsname="小白羊云盘"
_pkgname="XBYDriver"
pkgver=3.13.5
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('3420171837cecec3880114a4868351a1c29f429575429c43f5a9b94a98551426')
sha256sums_armv7h=('f1e9b8da7a94cfbd6b8fcf3a8adb7e399473b819f01e336e9f78b3a16b3601d5')
sha256sums_x86_64=('59dc465b59d149922278db38a78a1140921b37b312ae7f31640af99c261d7e3a')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|alixby3|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_zhsname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/"{crx,engine,images} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}