# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_appname="Peersky Browser"
pkgver=1.0.0
pkgrel=2
pkgdesc="A minimal p2p web browser."
arch=("x86_64")
url="https://peersky.p2plabs.xyz/"
_githuburl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron20')
makedepends=('npm' 'gendesk' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}-prerelease.tar.gz"
    "${pkgname}.sh")
sha256sums=('19365d7daf195ca82ced4c542ff62d26a337bc9df6152be4abc4e0cd35763954'
            'decb014fe4fab59a478fff856dd2402b5b6e17761aa62854f4af60a1a9ab382e')
build() {
    cd "${srcdir}/${pkgname%}-${pkgver}-prerelease"
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    asar pack "${srcdir}/${pkgname}-${pkgver}-prelease/build/linux-unpacked/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-prerelease/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-prerelease/build/linux-unpacked/resources/app/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname%}" --categories "Network" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}