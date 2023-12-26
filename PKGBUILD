# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vookiimageviewer-bin
_pkgname=VookiImageViewer
pkgver=2023.12.24
_exiv2version=0.27.1
pkgrel=1
pkgdesc="A cross-platform lightweight image viewer for a fast image preview."
arch=('x86_64')
url="https://vookiimageviewer.cz/"
_ghurl="https://github.com/vookimedlo/vooki-image-viewer"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'expat'
    'qt6-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/debian_stable_gcc_${pkgname%-bin}_${pkgver}_amd64.deb.zip"
    "exiv2-${_exiv2version}.zip::https://github.com/Exiv2/exiv2/releases/download/0.27.1/exiv2-0.27.1-Linux64.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('53fc2d650013982912d2fda3204a6b2189231b0f573e4da23640d6affeb33943'
            'caafad455c88f4d9cf8ab338204e8ffafac2110e7b8a332d296c274963abf460'
            '07c295fbb74a50ae5c27e5d0ee1a55f8ef4f3be793dcb7490d8d7df20be9d90a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|${pkgname%-bin}icon|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/imageformats/"*.so -t "${pkgdir}/opt/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/exiv2-${_exiv2version}-Linux64/lib/libexiv2.so"* -t "${pkgdir}/opt/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}