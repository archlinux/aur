_pkgname=animeko
pkgname=${_pkgname}-appimage
pkgver="6.1.0"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko'
license=('AGPL-3.0-or-later')
depends=('vlc-plugin-ffmpeg' 'vlc-plugin-dvb' 'vlc-plugin-pulse' 'gvfs' 'fuse2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')

_appimage="ani-${pkgver//_/-}-linux-${CARCH}.appimage"
source_x86_64=("${url}/releases/download/v${pkgver//_/-}/${_appimage}")
sha256sums_x86_64=('abeeab01daf4a08ab1cd7c4d9c6999b1741a577d93ad7e2ef28b80ea12296aa7')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    rm -rf squashfs-root
    "./${_appimage}" --appimage-extract >/dev/null
    sed -i -E "s|Icon=icon|Icon=${_pkgname}|g" "squashfs-root/${_pkgname}.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -a squashfs-root/* "${pkgdir}/opt/${_pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/Ani"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    ln -s "/opt/${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    ln -s "/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
