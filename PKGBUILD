# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apprhyme-bin
_pkgname=AppRhyme
pkgver=1.0.9
pkgrel=1
pkgdesc="使用Flutter和Rust构建的开源免费音乐软件"
arch=("x86_64")
url="https://github.com/canxin121/app_rhyme"
license=(
    'Apache-2.0'
    'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-release-linux-${CARCH}-${pkgver}.deb"
    "LICENSE-MIT-${pkgver}.txt::https://raw.githubusercontent.com/canxin121/app_rhyme/v${pkgver}/LICENSE-MIT.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('7133825d58a742a2c918b4f3bfdf8fc7ecb3912db319c5e856d599e85606969e'
            'c42abea1f8991d1a9024792163533e7976a13e8cdf5e6a3daaf7b3e8188239d9'
            'e1d93e9b149ac01fac5fc49f54c78e9f4fa1c134c52925af59e1f33ce79a4f93')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|Categories=Music;Player;|Categories=AudioVodeo;|g;s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/share/${_pkgname}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${_pkgname}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}