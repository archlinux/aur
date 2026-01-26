# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fylepad-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="a notepad with powerful rich-text editing, built with Vue & Tauri (Rust).(Prebuilt version)"
arch=('x86_64')
url="https://fylepad.vercel.app/"
_ghurl="https://github.com/imrofayel/fylepad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/imrofayel/fylepad/app-v${pkgver}/LICENSE"
)
sha256sums=('c4b4b07d7be3a1b7702153c261891a22e1ba44b96f76aa18c53a18b41cb89fe0'
            '9f744f8fc618bb8f55a2ba34dbcc67c2bc71d4485bcd1ae83703dc69ff9ea99d')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Development/Utility/g
        4i\Comment=${pkgdesc}/g
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
