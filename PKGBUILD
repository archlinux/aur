# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=proxyman
pkgname="${_pkgname}-bin"
pkgver=3.11.0
pkgrel=1
pkgdesc="Proxyman is a native, high-performance app, which enables developers to capture, inspect, and manipulate HTTP/HTTPS requests/responses with ease."
arch=('x86_64')
url="https://proxyman.io"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=('cairo' 'libxkbcommon' 'nss' 'libxfixes' 'glib2' 'expat' 'libcups' 'libxcomposite' 'libxrandr' 'libxcb' 'dbus-glib' 'mesa' 'nspr' 'libx11' 'pango' 'glibc' 'gdk-pixbuf2' 'gcc-libs' 'libxdamage' 'python' 'gtk2' 'libdbusmenu-glib' 'alsa-lib' 'bash' 'gtk3' 'libsecret' 'libxext' 'libdrm' 'at-spi2-core' 'dbus')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://github.com/ProxymanApp/proxyman-windows-linux/releases/download/${pkgver}/Proxyman-${pkgver}.AppImage?v=${pkgver//./-}"
    "LICENSE.md"
)
sha256sums=('873a527a2d2047d6a9709e8054da22a925092ccbcfd15ffa49398629e520e6f2'
            '4e971de9ede9734b775a1fa13fcb28d4fe3553e3dec5670d28ab2cb9ec035104')
build() {
    rm -rf "${srcdir}/squashfs-root/"
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed "s|Exec=AppRun|Exec=env APPDIR=/opt/${_pkgname} ${_pkgname}|g;s|Icon=proxyman|Icon=/opt/${_pkgname}/.DirIcon|g" \
        -i "${srcdir}/squashfs-root/proxyman.desktop"
    find . -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${_pkgname},usr/bin,usr/share/applications}
    cp -vr "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
    ln -sf "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    ln -sf "/opt/${_pkgname}/proxyman.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/opt/${_pkgname}"
}

