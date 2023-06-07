# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="deskaide-appimage"
pkgver=1.0.0.alpha.16
_pkgver=1.0.0-alpha.16
pkgrel=1
pkgdesc="An aide to your desk life!"
arch=('x86_64')
url="https://github.com/deskaide/deskaide"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
namedepends=('npm' 'yarn' 'gendesk' 'electron-builder')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('961371a61a539be9f9109277f39aafe2d4ab068427ee4afa6579edc4060d525c')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${_pkgver}"
    yarn install
    yarn build
    sed '50s|always|never|g' -i package.json
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${_pkgver}/dist/Deskaide-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 72x72 96x96 128x128 144x144 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-appimage}-${_pkgver}/assets/icons/linuxIcons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "${pkgname%-appimage}" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
