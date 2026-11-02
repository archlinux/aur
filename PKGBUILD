# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtspek-bin
_pkgname=QtSpek
pkgver=0.8.5
pkgrel=2
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
sha256sums=('d9c4b856276f517e0003afa7608e683774daca83c673af316fb7fea52187c08e'
            'dcc7757b1cbbf9ed0d52f6fb328950b7621906e0e2224ef0b7ee7c0acf23fa6e'
            '07b2c5694dcf561766e2d75a9de1afc667190d387b33d12adc78d2388b962e2c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/opt/ttk/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/ttk/${_pkgname}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/ttk/${_pkgname}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/ttk/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
