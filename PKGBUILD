# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="backend-ai-desktop-bin"
pkgver=23.03.2
pkgrel=1
pkgdesc="Backend.AI Web UI provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=("aarch64" "x86_64")
url="https://www.backend.ai/"
_githuburl="https://github.com/lablup/backend.ai-webui"
license=('LGPL3')
depends=('electron' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
conflicts=("${pkgname%-bin}" "backend.ai" "backend.ai-desktop")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/backend.ai-desktop-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/backend.ai-desktop-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('036ffa2982d728c163e6c63cc96e97146a7abdecf4b2ba710213380931ec2402')
sha256sums_aarch64=('571685a25cd5009d02878fdbda67fb9c423982e303577b0e132331409e62e351')
sha256sums_x86_64=('959d6d77878da4b467f1308a5a40dd59f635af7794d3dada31db91e0a480cd11')
package() {
    install -Dm644 "${srcdir}/Backend.AI Desktop-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    asar e "${pkgdir}/opt/${pkgname%-bin}/app.asar" "${srcdir}/tmp"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/tmp/app/manifest/${pkgname%-desktop-bin}.iconset/icon_${_icons}@1x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}