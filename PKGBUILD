# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname="Backend.AI Desktop"
pkgver=23.09.7
pkgrel=1
pkgdesc="Provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.backend.ai/"
_ghurl="https://github.com/lablup/backend.ai-webui"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('27e8e3578355522309a16c4812b43e11f4632196060696b2705a8fca9a65c3f3')
sha256sums_aarch64=('48bba4f5f37a0cd1e927aba67bf709593fffc0fb5aa1104b5eca4d2c2f3554e2')
sha256sums_x86_64=('6aba02d6302e6c4743529136a1e26ce5c2c734d5cf4f1da123d4a2976a990810')
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