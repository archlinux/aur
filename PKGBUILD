# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname="Backend.AI Desktop"
pkgver=23.09.5
pkgrel=1
pkgdesc="Backend.AI Web UI provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.backend.ai/"
_githuburl="https://github.com/lablup/backend.ai-webui"
license=('LGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname%-desktop}"
    "${_pkgname}"
)
depends=(
    'electron26'
    'hicolor-icon-theme'
)
makedepends=(
    'asar'
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('27e8e3578355522309a16c4812b43e11f4632196060696b2705a8fca9a65c3f3')
sha256sums_aarch64=('4b129cfbd43987858652eb352c209ca56f6c0bb7c25ff361eb654ab7d1b97fbe')
sha256sums_x86_64=('4a5f06a66b5a91a0a3dd84e641c34e6fbce655ff20cc102217ea45a519d13140')
build() {
    gendesk -q -f -n --pkgname="${_pkgname//./-}-bin" --categories "Development" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    asar e "${srcdir}/${_appname}-linux-"*/resources/app.asar "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/app.asar.unpacked/app/manifest/${pkgname%-desktop-bin}.iconset/icon_${_icons}@1x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}