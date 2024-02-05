# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kinda-bard-bin
_appname="Kinda Bard"
pkgver=1.0.0
_electronversion=24
pkgrel=7
pkgdesc="Google Bard Desktop Application"
arch=("x86_64")
url="https://www.zorbawong.com/"
_ghurl="https://github.com/zorbajwhk/KindaBard"
license=('AGPL-3.0-only')
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('01a88b842648036f9034e50ba5c626a33281ae23e4b279bf6aea67dc43aec75c'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}