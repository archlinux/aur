# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=proxyman
pkgname="${_pkgname}-bin"
pkgver=2.11.1
pkgrel=1
pkgdesc="Proxyman is a native, high-performance app, which enables developers to capture, inspect, and manipulate HTTP/HTTPS requests/responses with ease."
arch=('x86_64')
url="https://proxyman.io"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://github.com/ProxymanApp/proxyman-windows-linux/releases/download/${pkgver}/Proxyman-${pkgver}.AppImage?v=${pkgver//./-}"
    "LICENSE.md"
)
sha256sums=(
            '3818e76ed20504a8b870259747116da11f3747bdc97a02093d814388400b9295'
            '1f06e6dbbba57c36ef98daa6ad4893b944494b1e20bcf477eb78580476205f9a'
           )
build() {
    rm -rf "${srcdir}/squashfs-root/"
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed "s|Exec=AppRun|Exec=env APPDIR=/opt/${_pkgname} ${_pkgname}|g;s|Icon=proxyman|Icon=/opt/${_pkgname}/.DirIcon|g" \
        -i "${srcdir}/squashfs-root/proxyman.desktop"
    find -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${_pkgname},usr/bin,usr/share/applications}
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
    ln -sf "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    ln -sf "/opt/${_pkgname}/proxyman.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/opt/${_pkgname}"
}