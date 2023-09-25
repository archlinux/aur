# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=query-master
pkgver=0.4.6
pkgrel=1
pkgdesc="Just another MySQL GUI client"
arch=('any')
url="https://github.com/invisal/query-master"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('npm>=7' 'gendesk' 'nodejs>=14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('f8061b453a5109edb6f343f16ee2f5b209b552cb0cb573c96c95ec455aa478fa'
            'cef2d52eaf358a7d0bc66ef1a6bcb40f4a7f5fac1309f2be1875833c6de97375')
prepare() {
    gendesk -f -n -q --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    npm install --force
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/assets" "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}