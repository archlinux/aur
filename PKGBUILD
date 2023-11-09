# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pad-md
pkgver=0.5
pkgrel=3
pkgdesc="A notepad app for desktop, developed in Electron, with TS/JS, HTML and CSS."
arch=('any')
url="https://pad-md-landing-page.vercel.app/"
_githuburl="https://github.com/Coffee-for-Cats/pad-md"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'bash'
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
    "${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/stable5.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('ba91cffde64f9056dc31f8697f0c306f461bf27a46a1f9b0bbb2f1a3e624c22f'
            'f0be4efe01fb2181e28018810f759d0daeb13d4714a14cde7b667d0bc12cc747')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-stable5"
    npm install
    npm run build
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-stable5/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-stable5/png-icons/notepad.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}