# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="live-plus-plus-appimage"
pkgver=2.0.0beat1
_pkgver=2.0.0-beat1
pkgrel=1
pkgdesc="Lightweight live streaming client.轻量级的直播客户端"
arch=('x86_64')
url="https://github.com/dipelta/live-plus-plus"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "live++" "live++-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
makedepends=('npm' 'gendesk')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('fdd73284ad453a1c37c0de3d9ec0055c2fa6457754dbaaeabbfd187e640edbae')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${_pkgver}"
    sed '108s|}|},|g' -i package.json
    sed '108a\    "linux": {' -i package.json
    sed '109a\      "category": "AudioVideo;Utility",' -i package.json
    sed '110a\      "target": "appimage",' -i package.json
    sed '111a\      "icon": "build/linux/logo_256x256.png"' -i package.json
    sed '112a\    }' -i package.json
    npm install --force
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${_pkgver}/build_electron/live++-2.0.0.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname%-appimage}-${_pkgver}/build/icon.iconset/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "AudioVideo;Utility" --name "${pkgname%-appimage}" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}