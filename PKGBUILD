# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kando-bin
pkgver=0.3.0
_electronversion=28
pkgrel=1
pkgdesc="A pie menu for the desktop. It will be highly customizable and will allow you to create your own menus and actions. "
arch=("x86_64")
url="https://ko-fi.com/post/Introducing-Ken-Do-L3L7L0FQ2"
_ghurl="https://github.com/kando-menu/kando"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libxtst'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kando-menu/kando/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('3a06db0a24ea31be5741bd4877a88713d1ec2dd0671d09a1d768178ca654ab3c'
            'fd6cb731b549de5452efacb0833cda7a328eb5263537d29ca18de9d7938f7bab'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}