# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyplayer-bin
pkgver=3.3.4
_electronversion=19
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=(
    "aarch"
    "x86_64"
)
url="https://github.com/Hiram-Wong/ZyPlayer"
license=("MIT")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "zy-player"
)
depends=(
    "electron${_electronversion}"
)
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Hiram-Wong/ZyPlayer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('05a41f7b9dc819453e9c8c3ea4e144fe7e3d09d0f78bdf800e92810312f99094'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch=('6ce8dc78a5b96ec5f960827fdeec95234cabb3ea144b066e213bbd5effaeb982')
sha256sums_x86_64=('244c2b6f6f04d3f853d55e4827be2ac40879af33a01afeec2621fe61f59327c2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|Audio;Video|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}