# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woodfish-bin
_pkgname=WoodFish
_zhsname='木鱼'
pkgver=1.0.7
_electronversion=28
pkgrel=1
pkgdesc="A simple and feature-rich computer app for knocking on wooden fish.(Prebuilt version,use system-wide electron)一款简单而功能丰富的电脑敲木鱼应用"
arch=('x86_64')
url="https://github.com/silenceboychen/woodfish"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/silenceboychen/woodfish/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('17cb702ba6f47edd9d83a8864ccb82dc6e686b4bc4c4c34fda6a920b0e765aa5'
            '535423b7d4344c585d758c34f2bf1c9f02a64ae05a1b3c97cf3310c1cca9eb1f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}-app/${pkgname%-bin}/g
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}