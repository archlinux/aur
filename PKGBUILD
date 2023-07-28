# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pad-md
pkgver=0.5
pkgrel=1
pkgdesc="A notepad app for desktop, developed in Electron, with TS/JS, HTML and CSS."
arch=('any')
url="https://pad-md-landing-page.vercel.app/"
_githuburl="https://github.com/Coffee-for-Cats/pad-md"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron24')
makedepends=('gendesk' 'npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/stable5.tar.gz"
    "${pkgname}.sh")
sha256sums=('ba91cffde64f9056dc31f8697f0c306f461bf27a46a1f9b0bbb2f1a3e624c22f'
            '9d72bc47bde861a790771533f275041fe906e24c0617beb4655712f064e87ac1')
build() {
    cd "${srcdir}/${pkgname}-stable5"
    npm install
    npm run build
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/${pkgname}-stable5/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-stable5/png-icons/notepad.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "pad-md" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}