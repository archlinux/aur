# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtspek-bin
_pkgname=QtSpek
pkgver=0.8.5
pkgrel=1
pkgdesc="Qt-based spectrum analyzer, modified from Spek.(Prebuilt version)基于Qt的频谱分析器，修改于Spek"
arch=('x86_64')
url="https://github.com/Greedysky/QtSpek"
license=(
    'GPL-3.0-only'
    'LGPL-3.0-only'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'libgpg-error'
    'libxcb'
    'freetype2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-ubuntu-24.04-qt6-x64.deb"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('fce816047f7c636279f8bee4d77a6f6899371bed52cbf34e4f339ab4f42976d1'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
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
