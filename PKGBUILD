# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elephicon
pkgver=2.7.6
pkgrel=1
pkgdesc="A GUI wrapper for png2icons, generates Apple ICNS and Microsoft ICO files from PNG files."
arch=('x86_64')
url="https://github.com/sprout2000/elephicon"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron27'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm>=9'
    'nodejs>=18.18.7'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('7394524fbfbc571486b18cdc8938b5cf0dc64c8c1e1ebeb68415c549c24ca4f4'
            'f1778c05339e7117bf6d9e7668885896f23f2e98f9c47b8b15c2ad2d3084ae20')
build() {
    gendesk -q -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build
    npm run package
    cp release/.icon-set/icon_16x16.png release/.icon-set/icon_16.png
    cp release/.icon-set/icon_48x48.png release/.icon-set/icon_48.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar.unpacked/dist/images/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/dist/images"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}