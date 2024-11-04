# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-bin
_pkgname=Serial-Studio
pkgver=3.0.2
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program.Prebuilt version."
arch=('x86_64')
url="https://serial-studio.github.io/"
_ghurl="https://github.com/Serial-Studio/Serial-Studio"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'qt6-positioning'
    'gmp'
    'libglvnd'
    'qt6-declarative'
    'libgpg-error'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('ec1f7b27e717fb78c3cbacd97fe109bc0564bb0e5a4d287f1889bce442419572'
            'd2d20f56865ebe59a1a3ce0843cee2808f0c69f7a2ba2b9f7808f1d2df331586'
            '2a39e193905c92b426b83c70095b30ce7df9900c60f7c2e29ab2a2973eded130')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
