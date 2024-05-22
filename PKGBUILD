# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
_pkgname=Spacemesh
pkgver=1.5.4
_electronversion=25
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet). Use system-wide electron."
arch=(
    'aarch64'
    'x86_64'
)
url="https://spacemesh.io/"
_ghurl="https://github.com/spacemeshos/smapp"
_downurl="https://smapp.spacemesh.network/dist"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ocl-icd'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('0fe255d217ec60fb48bf5f9a1fc6f1aac39adb614f154839542deed36a6e849f')
sha256sums_x86_64=('4786721f50114265e0e3779a390a8e652043b9989006daf07169b286df60a818')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|resources/app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}_app|${pkgname%-bin}|g;s|${pkgname%-bin}_app|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}_app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/resources" "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/node" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}_app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}_app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}