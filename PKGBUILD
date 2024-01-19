# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vagrant-manager-bin
_pkgname="Vagrant Manager"
pkgver=2.3.2
_electronversion=5
pkgrel=3
pkgdesc="An electron, status bar menu app that lets you manage all of your vagrant machines from one central location."
arch=(
    "i686"
    "x86_64"
)
url="https://github.com/absalomedia/vagrant-manager"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'vagrant'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-amd64.deb")
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/absalomedia/vagrant-manager/master/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('aab8e4332f27b8c96aad7427a304e40a612f62af9bef709505452bd04d136c03'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_i686=('0878a5fa6482888db12d3ead7fa83f695079808871be2fd5105dd06bc8faacd9')
sha256sums_x86_64=('251e8bc77dd84f9aaf38529afa948b6a576856715f8990059a3104f0d10ab90b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}