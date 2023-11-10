# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xchat-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="使用 React+Vite、MobX 和 Electron 构建的非官方WeChat微信客户端。"
arch=("x86_64")
url="https://github.com/xYx-c/xchat"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron27'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/xYx-c/xchat/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9667f8e99a0e548b84795ccba05f65ed1d8d74fc2cd84cb20f4ca44df38ee9db'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
            '69681864471ddd45844163219ef7f8379ad21dd491917d8b17825414e453d46a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" \
        -e "s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -e "s|Utility|Network|g" \
        -e '/Comment/d' \
        -e "5i Comment=${pkgdesc}" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}