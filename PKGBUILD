# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ente
pkgname="${_pkgname}-desktop-bin"
pkgver=1.7.7
_electronversion=33
pkgrel=2
pkgdesc="Desktop app for ente Photos.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ente-io/photos-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #"electron${_electronversion}"
    'at-spi2-core'
    'gtk3'
    'nodejs'
    'http-parser'
    'nspr'
    'alsa-lib'
    'nss'
)
#makedepends=(
#    'asar'
#)
options=('!strip')
#source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.pacman")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('04e9cb4da8ec0793e9f3e00830c2ba4aca0e57edeac19810660145b75073d96b')
sha256sums_x86_64=('8272288c1bd379c4e2f3fc888f91d8acbdb998df3a56b709e6f41e240bb63482')
build() {
    #sed -e "
    #    s/@electronversion@/${_electronversion}/g
    #    s/@appname@/${pkgname%-bin}/g
    #    s/@runname@/app.asar/g
    #    s/@cfgdirname@/${_pkgname}/g
    #    s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    #" -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Photography/Graphics/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    #asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    #find "${srcdir}/app.asar.unpacked/app" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} \;
    #asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    #install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    #install -Dm755 "${srcdir}/opt/${_pkgname}/resources/image-magick" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    #install -Dm644 "${srcdir}/opt/${_pkgname}/resources/"{*.png,*.icns,*.plist} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    #cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
