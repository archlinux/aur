# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mubu-bin
_pkgname=Mubu
pkgver=3.7.3
_electronversion=11
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
    'imagemagick'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://assets.mubu.com/client/${_pkgname}-${pkgver}.exe"
    "LICENSE-${pkgver}.html::${url}/agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('dac7470975ed11fa529cbeed979da3741a180a1c7379ef0c0320263035085e7c'
            '82b6eb156214fd5c549a15dde79b720302662a08c4d01775f8670090655f7abd'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Office" --name "${_pkgname}" --exec "${pkgname} %U"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-32.7z" -o"${srcdir}/tmp"
    convert "${srcdir}/uninstallerIcon.ico" "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}