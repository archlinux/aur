# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mods-manager-for-3dmigoto-bin
_pkgname='Mods Manager for 3dmigoto'
pkgver=1.10.4
_electronversion=32
pkgrel=2
pkgdesc="A mods manager for 3dmigoto design for ZZZ(which can also use on other mod base on 3dmigoto).(Prebuild version.Use system-wide electron)"
arch=('x86_64')
url="https://gamebanana.com/tools/17889"
_ghurl="https://github.com/XiaoLinXiaoZhu/Mods-Manager-for-3Dmigoto"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}-${pkgver}.ico::https://raw.githubusercontent.com/XiaoLinXiaoZhu/Mods-Manager-for-3Dmigoto/v${pkgver}/icon.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('8f6447e9e03a1e51f1c6483320094ada3f70678d81f2bb831152dc0569a8523b'
            '9fd025b00043aa5273080675e096e49cc03d106b741c301021e111acc2b63d22'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    icotool -x "${srcdir}/${pkgname%-bin}-${pkgver}.ico" -o "${srcdir}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 72x72 96x96 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/"*"${_icons}"*.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}