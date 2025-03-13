# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=divicards-bin
_pkgname=Divicards
pkgver=0.7.10
pkgrel=1
pkgdesc="Desktop application for Path of Exile divination cards.(Prebuilt version)"
arch=('x86_64')
url="https://divicards-site.pages.dev/"
_ghurl="https://github.com/shonya3/divicards"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('0c7a2adbd0d9c56a600c7400f7fa871b3d04a6ec7d1e0e4f62feb9f5c6862857')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        4i\Comment=${pkgdesc}/g
        s/Exec=app/Exec=${pkgname%-bin}/g
        s/Icon=app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/app.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}