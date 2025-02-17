# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vookiimageviewer-bin
_pkgname=VookiImageViewer
pkgver=2025.02.15
#_exiv2version=0.28.4
pkgrel=1
pkgdesc="A cross-platform lightweight image viewer for a fast image preview.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://vookiimageviewer.cz/"
_ghurl="https://github.com/vookimedlo/vooki-image-viewer"
_exiv2url="https://github.com/Exiv2/exiv2"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'libraw'
    'qt6-base'
    'exiv2'
)
source=("${pkgname%-bin}.sh")
source_aarch64=(
    "${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/debian_trixie_clang_${pkgname%-bin}_${pkgver}_arm64.deb.zip"
    #"exiv2-${_exiv2version}-aarch64.zip::${_exiv2url}/releases/download/v${_exiv2version}/exiv2-${_exiv2version}-Linux-aarch64.tar.gz"
)
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/debian_trixie_clang_${pkgname%-bin}_${pkgver}_amd64.deb.zip"
    #"exiv2-${_exiv2version}-x86_64.zip::${_exiv2url}/releases/download/v${_exiv2version}/exiv2-${_exiv2version}-Linux-x86_64.tar.gz"
)
sha256sums=('346cd32afa9661092ead7c6b2fbc954ae402343306cd0b8e74f5d723e3dc5f20')
sha256sums_aarch64=('b0d6a44c45ff4ae2251fe12c8d9b26d597ee53940048fe46e6bec5830100098f')
sha256sums_x86_64=('31bb3d0dad2ce2b1f6a941f83d71b2503dfb8ef68ab96d3c114122684902d6fa')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/${pkgname%-bin}_"*.deb
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/${pkgname%-bin}icon/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/imageformats/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    #install -Dm644 "${srcdir}/exiv2-${_exiv2version}-Linux-${CARCH}/lib/libexiv2.so"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}