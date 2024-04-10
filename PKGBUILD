# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: espenaf <espenaf at junta dot no>
_appname="boost note"
pkgname="${_appname// /-}-bin"
_pkgname="Boost Note"
pkgver=0.23.1
_electronversion=12
pkgrel=2
pkgdesc="A document driven project management tool that maximizes remote DevOps team velocity."
arch=('any')
url="https://boostnote.io/"
_ghurl="https://github.com/BoostIO/BoostNote-App"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('391b4711af12e7d4a6ba90e428c990a2b9335cd537188e86704221fa47db2588'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_appname// /}.next|${_appname// /-}|g;s|Icon=${_appname// /}.next|Icon=${_appname// /-}|g" \
        -i "${srcdir}/usr/share/applications/${_appname// /}.next.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname// /}.next.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname// /}.next.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}