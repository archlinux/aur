# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkocr-bin
_pkgname=TTKOCR
pkgver=3.2.0.0
pkgrel=1
pkgdesc="TTKOCR recognizes text in images and PDFs, based on Qt.(Prebuilt version)识别图片以及PDF中的文字"
arch=('x86_64')
url="https://github.com/Greedysky/TTKOCR"
license=(
    'GPL-3.0-only'
    'LGPL-3.0-only'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'libgpg-error'
    'openssl'
    'libxcb'
    'freetype2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-ubuntu-24.04-qt6-x64.deb"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('dd829b066f2ec3b5c33c88898eb71fd58dce09837a00e3fda9612e702adfcc88'
            'a312b81018c0c7e233295736dd9525461b6145f63728bc471bb07591ec166f85'
            '4d70d090ce2d42eb020e170ac032345c954ecc723da08c4fb8e50624eba16a43')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
        s/@pkgver@/${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/opt/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_pkgname}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}