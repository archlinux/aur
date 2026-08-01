pkgname=animeko-appimage
_pkgname=animeko
pkgver="5.7.1"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://github.com/open-ani/animeko/releases/download/v${pkgver//_/-}/ani-${pkgver//_/-}-linux-${CARCH}.appimage")
sha256sums_x86_64=('4c2fdea3408aca8895815635c57ac34ae6ef59430ab786601ed31b5f7ebcb983')
depends=('vlc-plugin-ffmpeg' 'vlc-plugin-dvb' 'vlc-plugin-pulse' 'gvfs' 'fuse2')
conflicts=('animeko')
provides=('animeko')
options=('!strip')
noextract=("ani-${pkgver//_/-}-linux-${CARCH}.appimage")

prepare() {
  chmod +x "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage"
  "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage" --appimage-extract
  sed -i -E "s|Exec=Ani|Exec=/opt/${_pkgname}/${_pkgname}.AppImage|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
  sed -i -E "s|Icon=icon|Icon=${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -d "${pkgdir}/usr/share/applications"

    install -Dm755 "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
