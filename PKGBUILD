# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blix-bin
_pkgname=Blix
pkgver=1.3.0
_electronversion=24
pkgrel=6
pkgdesc="A cross-platform AI-assisted graph photo editor."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/COS301-SE-2023/AI-Photo-Editor"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('d1444cb7ed34ead088218271eebb6b02868a3a881fb400a14e21fe22b33f6f43')
sha256sums_x86_64=('cc3356aede7d58bfcc2758d700f6bd836181bc87566491b573f4bb4f031bab4f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|productivity|Graphics|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|e.app.isPackaged|!e.app.isPackaged|g" -i "${srcdir}/app.asar.unpacked/build/electron/lib/plugins/PluginManager.js"
    cp -r "${srcdir}/opt/${_pkgname}/resources/${pkgname%-bin}-plugins" "${srcdir}/app.asar.unpacked"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}