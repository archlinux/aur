# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
pkgver=3.17.0
pkgrel=1
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now."
arch=('x86_64')
url="https://app.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'qt5-base'
    'gtk3'
    'alsa-lib'
    'nss'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64_v${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('6b74dd083bfa3ecec5a0ee74d8ecbc4fce7b7a81d43c9246fdd43d83f190ec98'
            'a9c558d0ce9e8b9ae2ca6cb1933ddcb941e4554afb01c903680d969707ce735e')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    mv "${srcdir}/${pkgname%-bin}-linux-x64_v${pkgver}.AppImage" "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}