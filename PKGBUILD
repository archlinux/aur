# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=2024.02.04
pkgrel=1
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('LicenseRef-custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=(
    'nss'
    'alsa-lib'
    'libdrm'
    'openssl-1.0'
    'harfbuzz'
    'pipewire-jack'
    'mesa'
    'libthai'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://static-main.frdic.com/pkg/eudic.AppImage?v=${pkgver//./-}"
    "LICENSE-${pkgver}.html::https://www.eudic.net/v4/en/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('5b5e107fc99b700bfb519d2ecaf6877bbf117ceee7cc8f784c784e0be8b0a2a3'
            '12ec1b3e4be99eee9c2d5fb55c196d2294c1b112e137927c61f81efb0e308f75'
            '1c16d8f32224cacd37423b5731c8b4c5e652d18b3109ab649a992a13aca2a3df')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    rm -rf "${srcdir}/squashfs-root/"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed "s|/usr/share/${_pkgname}/AppRun|${pkgname%-bin}|g;s|Icon=com.eusoft.${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so "${srcdir}/squashfs-root/plugins/platforminputcontexts/"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}