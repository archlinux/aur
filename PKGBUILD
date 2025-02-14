# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quory-bin
_pkgname=Quory
pkgver=1.0.6
_electronversion=31
pkgrel=2
pkgdesc="The database client for support engineers 🧑‍🔧.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/CNimmo16/quory"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/%40quory%2Fclient%40${pkgver}/${pkgname%-bin}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('ad0748078664b982fd2d0a8602a0785369572d02e65d885ab873e7473c40bb9a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/@${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${pkgname%-bin}\/\${productName}/${pkgname%-bin}/g
        s/Icon=\${productName}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/\${productName}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/\${productName}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
