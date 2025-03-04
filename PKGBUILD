# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-desktop-bin
_appname="Kiwi IRC"
pkgver=1.7.1
_electronversion=25
pkgrel=8
pkgdesc="Next generation of the Kiwi IRC web client.(Prebuilt version.Use system-wide electron)"
arch=(
    'armv7h'
    'aarch64'
    'x86_64'
)
url="https://kiwiirc.com/"
_ghurl="https://github.com/kiwiirc/kiwiirc"
license=('Apache-2.0')
provides=("${pkgname%-desktop-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-desktop-bin}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armv7l.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_armv7h=('52b315f259afac82cc29c362addb3e9ee13362a9533619471d1b51110e310099')
sha256sums_aarch64=('e6735265dd06b5b76254dd00e54a6253468b8eb2c9306c3189143b47a42c4c6d')
sha256sums_x86_64=('94c71d9d625b4efae0b4862a1702bd6b18fe942cf2834196e43c5121dd5d7213')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_appname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/chat/Network/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i '/openDevTools/d' "${srcdir}/app.asar.unpacked/src/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}