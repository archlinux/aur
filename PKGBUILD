# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wasistlos-appimage
_pkgname=WasIstLos
_appname="com.github.xeco23.${_pkgname}"
pkgver=1.7.0
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for Linux."
arch=('x86_64')
url="https://github.com/xeco23/WasIstLos"
license=('GPL-3.0-only')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'glibc'
    'zlib'
)
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
)
sha256sums=('1256cf508426dc943c479ce2ef366a48a33165413e8f21e6a9ea579cd7184b0e')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}