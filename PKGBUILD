# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=proxyman
pkgname="${_pkgname}-bin"
pkgver=2.9.0
pkgrel=1
pkgdesc="Proxyman is a native, high-performance app, which enables developers to capture, inspect, and manipulate HTTP/HTTPS requests/responses with ease."
arch=('x86_64')
url="https://proxyman.io"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://github.com/ProxymanApp/proxyman-windows-linux/releases/download/2.9.0/Proxyman-2.9.0.AppImage?v=${pkgver//./-}"
    "LICENSE.md"
)
sha256sums=(
            '4dba91ec2de0ed68ceb724941bb76ac8e071d0c1607a442e341fa80fae048aa0'
            '1f06e6dbbba57c36ef98daa6ad4893b944494b1e20bcf477eb78580476205f9a'
           )
build() {
    rm -rf "${srcdir}/squashfs-root/"
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed "s|Exec=AppRun|Exec=${_pkgname}|g;s|Icon=proxyman|Icon=/opt/${_pkgname}/.DirIcon|g" \
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