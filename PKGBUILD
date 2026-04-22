# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=koharu-appimage
_pkgname=koharu
pkgver="0.47.6"
pkgrel=1
pkgdesc="ML-powered manga translator"
arch=('x86_64')
url='https://github.com/mayocream/koharu'
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-user-dirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("koharu_0.47.6_amd64.AppImage::https://github.com/mayocream/koharu/releases/download/0.47.6/koharu_0.47.6_amd64.AppImage")
sha512sums_x86_64=('46a9d0d404d3f8a106c3828473911c29b3c2d44080159d5503198e819a48068cfb1b8824b5406a23378828b46f7d0fdc8acafff5cff0a8366d84ee44f2f54429')
noextract=("koharu_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/koharu_${pkgver}_amd64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/koharu_${pkgver}_amd64.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

    install -Dm755 "${srcdir}/koharu_${pkgver}_amd64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
