# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woocommerce-pos-bin
_pkgname=WooCommercePOS
_appname=wcpos-app-electron
pkgver=1.3.3
pkgrel=2
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'at-spi2-core' 'pango' 'mesa' 'libxcomposite' 'glib2' 'alsa-lib' 'nspr' 'gtk3' 'nss' 'libxdamage' \
    'libdrm' 'dbus' 'libxext' 'libxcb' 'libxkbcommon' 'expat' 'libx11' 'libxrandr' 'gcc-libs' 'cairo' 'libxfixes' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('34b0c3d9fe4e8e6d0cbc30ed883c5f62cf0b80bea01cfdc7cbc135476cd8b54f')
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