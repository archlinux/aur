# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woocommerce-pos-bin
_pkgname=WooCommerce-POS
pkgver=1.3.10
pkgrel=1
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'at-spi2-core' 'pango' 'mesa' 'libxcomposite' 'glib2' 'alsa-lib' 'nspr' 'gtk3' 'nss' 'libxdamage' \
    'libdrm' 'dbus' 'libxext' 'libxcb' 'libxkbcommon' 'expat' 'libx11' 'libxrandr' 'gcc-libs' 'cairo' 'libxfixes' 'glibc' \
    'libdbusmenu-glib' 'dbus-glib' 'gtk2' 'bash' 'gdk-pixbuf2' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('243eafc502881c44f195888000dbf089628565a94395a9808301f883fcdc6917')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_pkgname//-/} %u|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_pkgname//-/}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname//-/}.desktop"
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname//-/}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname//-/}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}