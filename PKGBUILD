# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woocommerce-pos-bin
_pkgname=WooCommerce-POS
pkgver=1.3.12
_electronversion=25
pkgrel=5
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d81b4e1ab84cb00c124883e49a9dd1d2921eabf005974823d72906174562424'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_pkgname//-/} %u|${pkgname%-bin} %U|g;s|Icon=${_pkgname//-/}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname//-/}.desktop"
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
    sed "s|index.html|..\/..\/..\/${pkgname%-bin}\/dist\/index.html|g" -i "${srcdir}/squashfs-root/resources/app/.webpack/main/index.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app,dist} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname//-/}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}