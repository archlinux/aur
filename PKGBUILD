# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frigoligo-bin
_pkgname=Frigoligo
pkgver=2.1.3
pkgrel=1
pkgdesc="An universal wallabag client made with Flutter.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/casimir/frigoligo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'fuse2'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.AppImage")
sha256sums=('3feb1ea09cc75f148e715820992fd28a3881572e3540b629059f22293b2e17db'
            '811a4edf3363ba2a5413d1afe3fbed5d0f23ea09643528f10c4f00f1a6290ec4')
sha256sums_aarch64=('9ac281449374816b0f968f92df9070f295326d3ef16763b17d9a99ea43ce793c')
sha256sums_x86_64=('84bd68058bf8338c25e91ebe3e76b82c77173c5648d9f96232692993f55a83f9')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s/Exec=AppImage/Exec=${pkgname%-bin}/g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
