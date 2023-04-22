# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="melodie-appimage"
pkgver=2.0.0
pkgrel=4
pkgdesc="Melodie is a portable, simple-as-pie music player"
arch=('x86_64')
url="https://feugy.github.io/melodie/"
_githuburl="https://github.com/feugy/melodie"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
providers=(feugy)
options=(!strip)
_install_path="/opt/appimages/"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('3b841b77e3c974396e8317bcd14b7d023dfc7bd5dbc4c78f17eb53c143645dfe'
            '73c77debeee2edc386c515d1be6507325c36f4d5729e64743d7350ad146a3e2c')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/melodie.AppImage|g;s|Categories=Audio|Categories=AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}