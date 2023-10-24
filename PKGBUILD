# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fsolauncher
pkgver=1.9.2_prod.1
pkgrel=1
pkgdesc="Official FreeSO Launcher made with Electron"
arch=('x86_64')
url="https://beta.freeso.org/"
_githuburl="https://github.com/ItsSim/fsolauncher"
license=('MPL2')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'nodejs>=16.20.2')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('2c750858c140cfdd6000e3a64efff873a52e860c4429cc202ad15f75fd1c5691'
            '0264bc572b31604345e61a71d6af0cfdee9b3bbfdf0d4b9a51022c9157db21a3')
build() {
    gendesk -f -n -q --categories "Game" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/src"
    npm ci
    npx electron-builder --linux appimage
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/src/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/src/beta.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}