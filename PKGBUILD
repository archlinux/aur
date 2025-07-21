# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=11.6.0
pkgrel=1
pkgdesc="Authoritative English dictionary software, an essential tool for English learners.(Prebuilt version)权威的英语词典软件,英语学习者必备的工具."
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
    'harfbuzz'
    'mesa'
    'libthai'
    'fontconfig'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://static-main.frdic.com/pkg/eudic.AppImage?v=${pkgver//./-}"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('5b5e107fc99b700bfb519d2ecaf6877bbf117ceee7cc8f784c784e0be8b0a2a3'
            '89862f4074e530896863738bf9d49c03c8d0cd0f6a543d4ccc1cdc53e8f83a24'
            'f8da4fa48422d34fd5e2f8e1e87c9f52b66a7308a88855c39ae03599209dcbaf')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    rm -rf "${srcdir}/squashfs-root/"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/AppRun/env QT_AUTO_SCREEN_SCALE_FACTOR=1 QT_IM_MODULE=fcitx QT_QPA_PLATFORM=\"xcb\" ${pkgname%-bin}/g
        s/Icon=com.eusoft.${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/default.desktop"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so "${srcdir}/squashfs-root/plugins/platforminputcontexts/"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
