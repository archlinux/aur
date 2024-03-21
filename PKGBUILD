# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ctool_electron
pkgname="${_pkgname//_/-}-bin"
pkgver=2.3.0
_electronversion=26
pkgrel=5
pkgdesc="Common tools for program development.程序开发常用工具 chrome/edge/firefox/utools/windows/linux/mac"
arch=('x86_64')
url="https://ctool.dev"
_ghurl="https://github.com/baiy/Ctool"
license=('MIT')
provides=("${_pkgname//_/-}")
conflicts=("${_pkgname//_/-}" "${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_x64.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/packages/ctool-core/public/icon/icon_1024.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('39943b2ce2f0232e112d14f4f39ec0008ef71d435246067692ba6dc574298337'
            '77467c477d328a27c45d59d1b808511dcff33824ca674f1aad43c606d8a1ab9c'
            '459af2e36090998e7807b1d2a5b8d6a381bf94b69cbd2ec68e7943a09e2ce1e2'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${_pkgname//_/-}-bin" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/electron_linux_x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}