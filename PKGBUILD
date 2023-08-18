# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wp-desktop-bin
_appname=WordPress.com
_pkgname=wpcom
pkgver=8.0.2
pkgrel=1
pkgdesc="WordPress.com for Desktop"
arch=("x86_64")
url="https://apps.wordpress.com/desktop/"
_repourl="https://github.com/Automattic/wp-calypso/tree/trunk/desktop"
_downurl="https://github.com/Automattic/wp-desktop"
license=("GPL2")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/wordpress.com-linux-deb-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('27cd82824a89c392eee1378762989ac1f1cdf5b325f3f6d33cbc2b3e7426f221'
            '9628fe776189639c1bad3c5905de03eba5628c3a0c10c5365b88e712f326547c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${_appname}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${_appname}/${_pkgname} %U|${pkgname%-bin}/${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g;s|Social|Utility;Network|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}