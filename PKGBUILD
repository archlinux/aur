# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eshelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=13.5.2
pkgrel=1
pkgdesc="Authoritative Spanish dictionary software, an essential tool for Spanish language learners.西班牙语助手,权威的西班牙语词典软件,西班牙语学习者必备的工具."
arch=('x86_64')
url="https://www.esdict.cn/"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'nss'
    'alsa-lib'
    'libdrm'
    'mesa'
    'harfbuzz'
    'fontconfig'
    'libx11'
    'libxcb'
    'zlib'
    'pipewire-jack'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::https://static.eudic.net/pkg/${_pkgname}.AppImage"
    "LICENSE.html::https://dict.eudic.net/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('820cc6a27625cc12a0ca5a5069cd2ad03c82139719befcdde247c09b9021de0c'
            '784242f3284491915024fdf032ae1a5225c7411a02d1e5f449802143a194ed74'
            '201a36e0ee0aa94382edf92857d19862c819bb0878f367cdbbf23f2785223031')
pkgver() {
    cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    grep "X-AppImage-Version" "${srcdir}/squashfs-root/default.desktop" | sed "s/X-AppImage-Version=//g" > "${srcdir}/.pkgver"
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/AppRun/env QT_AUTO_SCREEN_SCALE_FACTOR=1 QT_IM_MODULE=fcitx QT_QPA_PLATFORM=\"xcb\" ${pkgname%-bin}/g
        s/Icon=com.eusoft.${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/default.desktop"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so "${srcdir}/squashfs-root/plugins/platforminputcontexts/"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
