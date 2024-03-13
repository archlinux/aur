# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-bin
pkgver=2.0.11
_electronversion=28
pkgrel=2
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ransome1/sleek/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('102246fbd3ad264049e8e9b61e1bc892db11e0ca389c7f7704ac32e76ce4a402'
            'dd26afa1adbe2d1321c4f80b45dcc0b6e5e9b986bcb8062f08c01086b7b52008'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|ProjectManagement|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 32x32 48x48 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}