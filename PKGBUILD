# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkdownloader-bin
_pkgname=TTKDownloader
pkgver=3.2.0.0
pkgrel=1
pkgdesc="TTKDownloader imitates xunlei downloader, based on Qt.(Prebuilt version)下载器模仿迅雷"
arch=('x86_64')
url="https://github.com/Greedysky/TTKDownloader"
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
sha256sums=('21502c2b8300635f595125c7bee3f060f533ca3dd7832a9b870024ea7fdd303e'
            '2e068b82f43b579789122c44a36895ac84a5b1723b050c78595adc3845514c04'
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
