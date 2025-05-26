# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyfun-bin
pkgver=3.3.10
_electronversion=34
pkgrel=2
pkgdesc="Cross-platform desktop video resource player, free high value.(Prebuilt version.Use system-wide electron)跨平台桌面端视频资源播放器,免费高颜值"
arch=(
    'aarch'
    'x86_64'
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
sha256sums_aarch=('961febfa564422dd278a3c5a4226d39f73a1c0ef4b2798d85b203f8b79813fb3')
sha256sums_x86_64=('831a3ea9513acb66cac747b51047989e222e635c5abfe46ee19ea88fc25ad47e')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/Audio;Video/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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