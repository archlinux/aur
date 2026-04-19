# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=koharu-appimage
_pkgname=koharu
pkgver=0.44.6
pkgrel=2
pkgdesc="ML-powered manga translator"
arch=('x86_64')
url='https://github.com/mayocream/koharu'
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-user-dirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("koharu_${pkgver}_amd64.AppImage::https://github.com/mayocream/koharu/releases/download/${pkgver}/koharu_${pkgver}_amd64.AppImage")
sha512sums_x86_64=('aa3021b00e1b0da0a6ffee4c2e512d03db2abfe80de1947956391267fbb0d730d5f5ee996b38c1378ae56803e247713a1d3e977f9e0ea18ac3a14d5e6e685861')
noextract=("koharu_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/koharu_${pkgver}_amd64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/koharu_${pkgver}_amd64.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    install -Dm755 "${srcdir}/koharu_${pkgver}_amd64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/koharu.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}