# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simplemediaupscalerlite-bin
_pkgname=SimpleMediaUpscalerLite
pkgver=2.0.0
_electronversion=24
pkgrel=4
pkgdesc="A Electron & CLI frontend to upscale images/videos using multiple different algorithms"
arch=('x86_64')
url="https://janishutz.com/projects/smuL"
_ghurl="https://github.com/simplePCBuilding/SimpleMediaUpscalerLite"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'libffi'
    'openssl'
    'expat'
    'xz'
    'bzip2'
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('f70793f387a7028e55890b594c255312eb8a1e8e0284e4e30698be4835209d45'
            '045c7cdf316fe8cba85e1d9b5f2b58ed1b0725f5efe28d7914df29304e2996a9')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Utility|Utility;Graphics|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"{bin,config,lib-dynload} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}