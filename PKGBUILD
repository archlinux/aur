# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-bin
_pkgname=Serial-Studio
pkgver=3.1.6
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://serial-studio.github.io/"
_ghurl="https://github.com/Serial-Studio/Serial-Studio"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'qt6-positioning'
    'libglvnd'
    'qt6-declarative'
    'libgpg-error'
    'qt6-quick3d'
    'qt6-multimedia'
    'qt6-location'
    'qt6-virtualkeyboard'
    'qt6-webengine'
)
options=('!strip')
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-x86_64.AppImage")
sha256sums=('b690696d937a66bf5876f1da26c616e59e1735ac1d062d91d6f99037cf86cfb5'
            '382dfc92c53dd659fb6644b4ab93915bff23075d0a2368147d8096c22533db8b')
sha256sums_aarch64=('a1b126ab5dfd789ef9c9566ec61661879b6da430089745a82737d1e53a6dee99')
sha256sums_x86_64=('66ebfec7cd997c15a2bf1798ca83b8d171ba949887250136360c99979eaba911')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}