# Maintainer: Satyam Jha <satyam_jha at zohomail dot in>
# Contributor: Daniel Alejandro <dalejan051@gmail.com>

pkgname=simpmusic-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="A simple free music player app based on YouTube Music"
arch=('x86_64')
url="https://github.com/maxrave-dev/SimpMusic"
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'gstreamer' 'gst-plugins-good' 'gst-plugins-bad' 'yt-dlp')
options=('!strip')
provides=('simpmusic')
conflicts=('simpmusic')
_appimage="SimpMusic-x86_64.AppImage"
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('ecb2124021460fa267fc496f090c57360fca9faf366593a0d84e85291b5be581')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

build() {
    sed -i \
        -e "s|^Exec=.*|Exec=/usr/bin/simpmusic|" \
        -e "s|^TryExec=.*|TryExec=simpmusic|" \
        -e "s|^Icon=.*|Icon=simpmusic|" \
        squashfs-root/simpmusic.desktop
}

package() {
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 squashfs-root/simpmusic.desktop "${pkgdir}/usr/share/applications/com-maxrave-simpmusic-MainKt.desktop"
    install -Dm644 squashfs-root/simpmusic.png "${pkgdir}/usr/share/pixmaps/simpmusic.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/simpmusic"
}
