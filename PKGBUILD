# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=md-tauri-bin
_pkgname='MD-Tauri'
pkgver=1.1.2
pkgrel=1
pkgdesc="A modern Markdown editor built with Tauri and Vue 3, providing a seamless desktop experience for Markdown editing and preview.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/CrazyMrYan/md-tauri"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CrazyMrYan/md-tauri/v${pkgver}/LICENSE"
)
sha256sums=('5e56511a1bb6284a808be3418decc90029d43b006be6918f9f0c6dd82366a356'
            '0637ca3d95394b496a9e0878bd64aa6dd50c1952d2c07d643281e134d1403d39')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        4i\Comment=${pkgdesc}/g
        s/Development/Utility/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}