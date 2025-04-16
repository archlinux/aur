# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fylepad-bin
pkgver=2.2.0
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
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/imrofayel/fylepad/app-v${pkgver}/LICENSE"
)
sha256sums=('2a09655d6829f1c4d75d7825bd299f7f6406589bec037494b7b038d91d10d0b1'
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
