# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nativefier-gui-bin
pkgver=0.9.0
_electronversion=26
pkgrel=8
pkgdesc="Graphical user interface for nativefier. Make any web page a desktop application.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://mattruzzi.github.io/nativefier-gui/"
_ghurl="https://github.com/mattruzzi/nativefier-gui"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'nodejs-nativefier'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('7e0f3055aab320dd7b337dc1cf8f222c3b023e7495265b90bc9e0b4d5834cb26')
sha256sums_armv7h=('d4b35c11f7e27e96fa8602c05eb70df7a86829b72799a9da6b949ea656872c79')
sha256sums_x86_64=('646a5400588a25186361eeab27282e6a4a28edc400e1585a5dee48a8c72c6360')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -n -q -f --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}