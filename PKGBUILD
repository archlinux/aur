# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xchat-bin
pkgver=1.0.0
_electronversion=27
pkgrel=6
pkgdesc="Unofficial WeChat client side built with React18 + Vite4, MobX and Electron27.(Prebuilt version.Use system-wide electron)使用 React18+Vite4、MobX 和 Electron27 构建的非官方WeChat微信客户端"
arch=('x86_64')
url="https://github.com/xYx-c/xchat"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/xYx-c/xchat/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('870777dd9c7c7f007f31f96d6a4772896bd4557eb9d81f6fcc85f4fbc792c0c9'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g
        s/Utility/Network/g
        s/Comment=Electron Vite React boilerplate./Comment=${pkgdesc}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}