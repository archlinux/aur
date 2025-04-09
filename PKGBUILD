# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lightrail-core-bin
pkgver=0.3.9
_electronversion=24
pkgrel=8
pkgdesc="An open-source AI command bar that seeks to simplifies software development.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://lightrail.ai/"
_ghurl="https://github.com/lightrail-ai/lightrail"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python>=3'
    'python-setuptools'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lightrail-ai/lightrail/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('029f561476c3b6c6de455533489767994c9ef53e9ee570c0aa7856f86532f35b'
            '979fa2f24e61dc088e74d67f0cb0f6db041ea88b1574c5a1ec1c71c8a083a2c3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-core-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-core-bin}/resources/"{app,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}