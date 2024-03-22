# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wp-desktop-bin
_appname=WordPress.com
_pkgname=wpcom
pkgver=8.0.3
_electronversion=24
pkgrel=6
pkgdesc="WordPress.com for Desktop"
arch=("x86_64")
url="https://apps.wordpress.com/desktop/"
_repourl="https://github.com/Automattic/wp-calypso/tree/trunk/desktop"
_downurl="https://github.com/Automattic/wp-desktop"
license=("GPL-2.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/wordpress.com-linux-deb-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('87efe96a1b88263df6bf21b11480c7427e275fe28c42fcf52aabde577743d186'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_appname}/${_pkgname}|${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g;s|Social|Utility;Network|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}