# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname="Backend.AI Desktop"
pkgver=23.03.5
pkgrel=2
pkgdesc="Backend.AI Web UI provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=("aarch64" "x86_64")
url="https://www.backend.ai/"
_githuburl="https://github.com/lablup/backend.ai-webui"
license=('LGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname%-desktop}" "${_pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('8fce9e03095fcadf6df1bbb8c609889bf6d0465031117ce626d14798eda5c655')
sha256sums_aarch64=('4f903b42c05136ccce7c2139f5839267a04320787bb3e4ca194ec7ed4dd96a95')
sha256sums_x86_64=('5f05c7dcf5d98423227eab5b6290b7b2044300628381118f640864e1beae1db8')
build() {
    gendesk -q -f -n --pkgname="${_pkgname//./-}-bin" --categories "Development" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    asar e "${srcdir}/${_appname}-linux-"*/resources/app.asar "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/app.asar.unpacked/app/manifest/${pkgname%-desktop-bin}.iconset/icon_${_icons}@1x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}