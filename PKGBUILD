# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=numara-bin
_pkgname=Numara
pkgver=5.4.1
_electronversion=32
pkgrel=1
pkgdesc="Simple notepad calculator built on Electron, powered by Math.js"
arch=(
    'aarch64'
    'x86_64'
)
url="https://numara.io/"
_ghurl="https://github.com/bornova/numara-calculator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bornova/numara-calculator/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('b944c7642b6a0ccf0c24e98d199d8bf4c8d556ebc7d87ddb9af98cab67b378b5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('13a228005e0250ec2862a15e4451aed0bbefdecafef14dde43886db6020f580c')
sha256sums_x86_64=('0847c52f4399cf0d00e3e6bda8f7bc233361f06132dc18dba1dc83d09cd2d2c4')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}