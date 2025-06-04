# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dtv-bin
_pkgname=DTV
pkgver=3.3.6
pkgrel=1
pkgdesc="Lightweight Douyu live streaming desktop client.(Prebuilt version.Use system-wide electron)轻量化斗鱼直播桌面客户端"
arch=('x86_64')
url="https://github.com/c-zeong/DTV"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/c-zeong/DTV/v${pkgver}/LICENSE"
)
sha256sums=('2ac21d3cf5ac1394bae96ec0ea831398f1801a12374cf52b845d11664cda0ca5'
            'ca61883629a40325b21aa31860f834ebfee4c71cce39a519c80732183ac73315')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=AudioVideo;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
