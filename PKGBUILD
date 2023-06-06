# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="query-master-appimage"
pkgver=0.1.0
pkgrel=1
pkgdesc="Just another MySQL GUI client"
arch=('x86_64')
url="https://github.com/invisal/query-master"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "live++" "live++-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
makedepends=('yarn' 'gendesk')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97588df0cdb6a83943ca9bf293559f2197e383e45b99e5451a236c743306e17c')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    yarn install
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}/release/build/${pkgname%-appimage}-${pkgver}-linux_${CARCH}.AppImage" \
        "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Development;Utility" --name "${pkgname%-appimage}" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}