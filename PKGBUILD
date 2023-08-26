# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn
pkgver=0.26.0
pkgrel=1
pkgdesc="A desktop screensaver app using web technologies"
arch=('any')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26' 'python' 'glibc' 'gcc-libs')
makedepends=('npm' 'nodejs>=18.15.0' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('15b46edeb6bf3021bb2f4928dad58f55c1aede54c43fba2272734ac9b6aa0003'
            '274a2ed73ad2a6eddb9ad4b6f7c6e0cfd42d60ae4222a01077ec654f3f9d16c8')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed '141,155d' -i package.json
    sed '124,139d' -i package.json
    npm run dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    cp -r  "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "Before Dawn" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}