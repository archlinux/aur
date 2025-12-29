# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-bin
_pkgname=Serial-Studio
pkgver=3.2.1
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://serial-studio.com/"
_ghurl="https://github.com/Serial-Studio/Serial-Studio"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'libglvnd'
    'qt6-declarative'
    'libgpg-error'
    'qt6-quick3d'
    'qt6-multimedia'
    'qt6-virtualkeyboard'
    'qt6-webengine'
    'qt6-5compat'
)
options=('!strip')
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Pro-${pkgver}-Linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Pro-${pkgver}-Linux-x64.AppImage")
sha256sums=('bc8a79ec026bf93f896e5aecc1334b2b093bbc17745b1a71adad3c2fa98ad93a'
            '382dfc92c53dd659fb6644b4ab93915bff23075d0a2368147d8096c22533db8b')
sha256sums_aarch64=('8ee53c99b2848a17a3a102d3df233d38ac7e5ae2365e5ad18f01676fcda11d31')
sha256sums_x86_64=('e1aabb5aa335003d544340a8d1359fd80ccc89f340c738512c3cc81b28716e89')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}-pro/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${pkgname%-bin}-pro/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-pro/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}-pro.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}-pro.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}-pro.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
