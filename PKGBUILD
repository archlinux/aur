# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woocommerce-pos-bin
_pkgname=WooCommercePOS
_appname=wcpos-app-electron
pkgver=1.3.3
pkgrel=1
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'at-spi2-core' 'pango' 'mesa' 'libxcomposite' 'glib2' 'alsa-lib' 'nspr' 'gtk3' 'nss' 'libxdamage' \
    'libdrm' 'dbus' 'libxext' 'libxcb' 'libxkbcommon' 'expat' 'libx11' 'libxrandr' 'gcc-libs' 'cairo' 'libxfixes' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('e521ce1eaec8dd0c37c85f44770f5996a8a74726c01677b7114c43ed9b826727')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    chmod 0755 "${srcdir}/usr/lib/${_appname}/chrome-sandbox"
    sed "s|${_appname} %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/lib/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}