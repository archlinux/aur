# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-bin
_pkgname=AFFiNE
pkgver=0.13.0
_electronversion=29
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-stable-linux-x64.appimage"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/packages/frontend/core/public/favicon-192.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('af0a693814917b00c90f6f0c53b4c5ba27bb0a9d00d7e8c5cbd7d1695c6a91f8'
            'b266795bb7f2dd32b76ef8f05788bbd63da556629265cca13217167cfc4d9cde'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_pkgname} %u|${pkgname%-bin} %U|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/app.asar.unpacked/dist/${pkgname%-bin}.linux-x64-gnu.node" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/dist"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}