# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
_pkgname=VNote
pkgver=3.18.1
pkgrel=1
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now."
arch=('x86_64')
url="https://app.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-webengine'
    'qt6-webchannel'
    'qt6-5compat'
    'alsa-lib'
    'nss'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
    '!staticlibs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('398e9a20fcefc27babc47e0f4a8a9795ce216ef6221e452af5e2f52b32f62881'
            'e262a4a522353121329ae7d80b54ed1626b37bc18b72a609b0def526453ae0a5')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    mv "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}