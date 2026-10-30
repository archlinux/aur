# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=26.9.1
pkgrel=2
pkgdesc="Authoritative English dictionary software, an essential tool for English learners.权威的英语词典软件,英语学习者必备的工具."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('LicenseRef-custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    'nss'
    'alsa-lib'
    'libdrm'
    'mesa'
    'harfbuzz'
    'fontconfig'
    'libx11'
    'libxcb'
    'glib2'
    'zlib'
    'gdk-pixbuf2'
    'pipewire-jack'
    'libusb'
    'fribidi'
    'pango'
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
sha256sums=('7839456abede4b8a47cacf2d3fcf24ce25c4296e305f9618920bd83cc21c83a6'
            '89862f4074e530896863738bf9d49c03c8d0cd0f6a543d4ccc1cdc53e8f83a24'
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