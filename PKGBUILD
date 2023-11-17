# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pad-md
pkgver=0.6
pkgrel=1
pkgdesc="A notepad app for desktop, developed in Electron, with TS/JS, HTML and CSS."
arch=('any')
url="https://pad-md-landing-page.vercel.app/"
_githuburl="https://github.com/Coffee-for-Cats/pad-md"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'electron24'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'dpkg'
    'fakeroot'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/stable${pkgver//0./}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('6cada9b66b9aa33f702239f38cd7e0b96631c860592e68427a759dc8f04b8fb5'
            'f0be4efe01fb2181e28018810f759d0daeb13d4714a14cde7b667d0bc12cc747')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-stable${pkgver//0./}"
    npm install
    npm run build
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-stable${pkgver//0./}/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-stable${pkgver//0./}/png-icons/notepad.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}