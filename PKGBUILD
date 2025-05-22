# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname='Backend.AI Desktop'
pkgver=25.8.1
_electronversion=30
pkgrel=1
pkgdesc="Provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.backend.ai/"
_ghurl="https://github.com/lablup/backend.ai-webui"
license=('LGPL-3.0-or-later')
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('9d20e721e5944fbca0291c36196c44c683ee380f0f066a3165d9db7ce9b2cab3')
sha256sums_x86_64=('588a60742dea15ef483d51886b9341e9ca20393040768ea6ab1a736cbccf2730')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
