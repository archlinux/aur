# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=frhelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=13.5.2
pkgrel=1
pkgdesc="Authoritative French dictionary software, an essential tool for French learners.法语助手,权威的法语词典软件,法语学习者必备的工具."
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/frhelper"
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
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('54b3547355e4f80aa3e5eddd41437415137d2c2a09feda0944c39c47921af09c'
            'c12c477048571d64eb8651ec470bfc1b3b738b591cfce0322eeadbe921a86917'
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
