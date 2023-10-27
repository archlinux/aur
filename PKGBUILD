# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peershare
pkgver=0.0.9
pkgrel=1
pkgdesc="A peer-to-peer file sharing app,enables you to share files to your friends, family, colleagues etc, using peer-to-peer technology."
arch=('x86_64')
url="https://github.com/connor-davis/peershare"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron27'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('db270208607d944a255e16a590dd33e040b98ac5d2f5de8832e70d15b8dedf55'
            '3cbd5b6373d2ed9d8d8de30bd0eef8c9000504eee0f90d648be98626e92816b3')
build() {
    gendesk -q -f -n --categories "Utility" --name "PeerShare" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed 's|"tar.gz"|"AppImage"|g' -i package.json
    npm install
    npm run build
    npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}