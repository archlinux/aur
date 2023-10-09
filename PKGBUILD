# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sharing-gui
_pkgname=sharing-GUI
_appname="Sharing GUI"
pkgver=1.4.0
pkgrel=1
pkgdesc="Easily share files to multiple devices on the LAN/Public Network."
arch=('x86_64')
url="https://sharing-gui.yuanx.me/"
_githuburl="https://github.com/imyuanx/sharing-GUI"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron21')
makedepends=('gendesk' 'npm' 'asar' 'nodejs' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('090e58817bf3dd3859ac4353cbb4634ac69f03a086a70d8e789dded5fdae6578'
            '3a0ae784d64cbd97f499db35b9d8c179ec55bc11f559ebbfd0517957bb747095')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed '54,57d' -i forge.config.js
    yarn install
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/logo-512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}