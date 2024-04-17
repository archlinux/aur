# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname="Backend.AI Desktop"
pkgver=24.03.2
_electronversion=29
pkgrel=1
pkgdesc="Provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.backend.ai/"
_ghurl="https://github.com/lablup/backend.ai-webui"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname%-desktop}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/lablup/backend.ai-webui/v${pkgver}/manifest/backend-ai.iconset/icon_512x512%401x.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('c54209c33c387908bfaae40a9c5f6c96bacaa52684f2546068e2b4441f4a53b3'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('431a7b7ecacd8f2e6c78ff9c42ddb3c2bb01a528f50d66061ad79f8a70d711d2')
sha256sums_x86_64=('5b20b5085bb2fb54e14db7a08a0f4467ab52951e393260c3cc5be46d7a779270')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${_pkgname//./-}-bin" --categories="Development" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    asar e "${srcdir}/${_appname}-linux-"*/resources/app.asar "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}