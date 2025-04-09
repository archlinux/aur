# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kindle-companion-bin
_pkgname=Kindle-Companion
pkgver=1.0.6
_electronversion=20
pkgrel=12
pkgdesc="Kindle Companion enables readers to easily access and manage vocabulary lookups and clippings on their Amazon Kindle device.(Prebuilt version.Use system-wide electron)"
arch=("x86_64")
url="https://saharzelo.github.io/kindle-companion/"
_ghurl="https://github.com/saharzelo/kindle-companion"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/saharzelo/kindle-companion/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('564bc5e3eb16f9af6fc7b9727e500e9a0f4fd4ce2d040de3d0faf636df5452a3'
            '613e2910e5cda3ce6e5b878e214d955c2a34e3475e97d365fcbec5e345a06038'
            '2b2e8aeed291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a198033fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/process.resourcesPath,\"..\"/\"\/usr\/lib\/${pkgname%-bin}\",\".\"/g
        s/__dirname/\"\/usr\/lib\/${pkgname%-bin}\"/g
    " "${srcdir}/app.asar.unpacked/packages/main/dist/index.cjs"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/buildResources" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}