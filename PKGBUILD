# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fsolauncher
pkgver=1.9.1_prod.11
pkgrel=1
pkgdesc="Official FreeSO Launcher made with Electron"
arch=('x86_64')
url="https://beta.freeso.org/"
_githuburl="https://github.com/ItsSim/fsolauncher"
license=('MPL2')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('75c0675daa91d80719b0f11850fa34db7a9da65a2a4341af73d488687322318d'
            '7c3f5f1d3e34f4ffea0530516f26635a15e6d886291829825cc8666b4324dfbd')
build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/src"
    npm install
    npx electron-builder --linux appimage
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/src/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/src/beta.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Game" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}