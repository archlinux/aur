# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn
pkgver=0.25.0
pkgrel=1
pkgdesc="A desktop screensaver app using web technologies"
arch=('any')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'python' 'glibc')
makedepends=('npm' 'nodejs>=18.15.0' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7cd508e575c8730b429c332b83b50d92b07329c389b36b9ac85594107590a8ff'
            '7c59278866b965bfff48b30a163243d1e6b4278388e34699d4707334f79c54a7')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
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