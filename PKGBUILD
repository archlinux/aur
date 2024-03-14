# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onote-bin
_pkgname=ONote
pkgver=0.11.0
_electronversion=25
pkgrel=3
pkgdesc="Markdown note taking application, based on monaco editor, supports local and SSH data sources.Markdown笔记应用,基于monaco-editor,支持本地及SSH数据源"
arch=("x86_64")
url="https://github.com/pansinm/ONote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pansinm/ONote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('747f8a5979935f7615d4accc55414951e067fbcd6a5bb77a8f46d9631b5d1532'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}