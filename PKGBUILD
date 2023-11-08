# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wai-chat-desktop
_pkgname="Wai Chat"
pkgver=1.1.2
pkgrel=3
pkgdesc="An electron project for chatgpt wai chat bot"
arch=('any')
url="https://github.com/ptp-build/wai-chat-desktop"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron24'
    'hicolor-icon-theme'
)
makedepends=(
    'npm>=8'
    'gendesk'
    'nodejs>=14'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('7f69542f9d0fccf9e2cd26ed495580731fbc9a45658576ab8c65a9c0537c89ab'
            'fa63c9586762a7c0cc52fd37a8da75944acd0c5a18db5ea6e29b1b4c7e5b4593')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '19,22d' -i forge.config.ts
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icons/favicon.${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}