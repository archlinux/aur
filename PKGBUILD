# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mubu-bin
_pkgname=Mubu
pkgver=4.0.2
_electronversion=9
pkgrel=1
pkgdesc="一款结合了大纲笔记和思维导图的头脑管理工具(packed from origin exe, use system electron)"
arch=('x86_64')
url="https://mubu.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'p7zip'
    'gendesk'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://assets.mubu.com/client/${_pkgname}-${pkgver}.exe"
    "LICENSE-${pkgver}.html::${url}/agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('0dfdcec5c5346009a45b6bb5e48c50ce544a6cb53b7d4dc3f63ec33a9ece32b9'
            '023b3c0cc74ff7e75ab58817a51c3f20f309ad2c295b20c1d9f736fb33f1392b'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="Office" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-32.7z" -o"${srcdir}/tmp"
    icotool -i 1 -x "${srcdir}/uninstallerIcon.ico" -o "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}