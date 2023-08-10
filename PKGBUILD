# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=backend-ai-desktop-bin
_appname="Backend.AI Desktop"
_pkgname=backend.ai-desktop
pkgver=23.03.4
pkgrel=2
pkgdesc="Backend.AI Web UI provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=("aarch64" "x86_64")
url="https://www.backend.ai/"
_githuburl="https://github.com/lablup/backend.ai-webui"
license=('LGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "backend.ai" "${_pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('5f9e1775b75bb437ad0948a058bd9e387e7e74166dc1db86222a2c3fbe7cb2c2')
sha256sums_aarch64=('6820d53750d57c4629bf6d9697209b4933643b73f65b4a96a9aeebbbaab40813')
sha256sums_x86_64=('c9da936549d970481449aabdf53840efa4116dec4897f371f271acb54afdd823')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    asar e "${pkgdir}/opt/${pkgname%-bin}/app.asar" "${srcdir}/app.asar.unpacked"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/app.asar.unpacked/app/manifest/${pkgname%-desktop-bin}.iconset/icon_${_icons}@1x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}