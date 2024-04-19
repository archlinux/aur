# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wj-markdown-editor-bin
pkgver=1.2.4
_electronversion=29
pkgrel=1
pkgdesc="An open-source desktop markup editor that supports webdav.一款支持webdav的开源桌面端markdown编辑器"
arch=('any')
url="https://github.com/nlbwqmz/wj-markdown-editor"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nlbwqmz/wj-markdown-editor/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5dd625ec67973c85f9e13fab6af2fd94d53ec8f5ff32ed642e0f9550162c1864'
            '4db85f2bcfa2b60623a893393a61158a562fd907cf1244a06f41fd11eb6f8605'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}