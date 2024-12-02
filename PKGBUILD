# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyfun-bin
pkgver=3.3.9
_electronversion=33
pkgrel=1
pkgdesc="Cross-platform desktop video resource player, free high value.(Prebuilt version.Use system-wide electron)跨平台桌面端视频资源播放器,免费高颜值"
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
    "zyplayer"
)
depends=(
    "electron${_electronversion}"
)
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Hiram-Wong/ZyPlayer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('05a41f7b9dc819453e9c8c3ea4e144fe7e3d09d0f78bdf800e92810312f99094'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch=('398646c571736b859337d3820bb4cbae6eebad0f28fa439b39a48dc71d5cc752')
sha256sums_x86_64=('f4fbb5bc7c963c250c20594630be304d8d37550fab7acca3d2ed3e2b029ca25f')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Audio;Video/AudioVideo/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
