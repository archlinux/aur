# Maintainer: Mattia225 <mattiavolpato5@gmail.com>
pkgname=simpmusic
pkgver=1.3.0
pkgrel=1
pkgdesc="SimpMusic with environment fixes for Wayland"
arch=('x86_64')
url="https://github.com/maxrave-dev/SimpMusic"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gstreamer' 'gst-plugins-good' 'gst-plugins-bad' 'yt-dlp')
provides=('simpmusic')
conflicts=('simpmusic' 'simpmusic-bin')
options=('!strip')

_appimage="SimpMusic-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract > /dev/null
}

package() {
    # 1. Crea la directory di destinazione in /opt
    install -dm755 "${pkgdir}/opt/simpmusic"

    # 2. Copia l'intera cartella estratta (il trucco per evitare FUSE)
    cp -r squashfs-root "${pkgdir}/opt/simpmusic/"

    # 3. Crea lo script wrapper (il fix per Wayland)
    install -dm755 "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/simpmusic"
#!/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1
export SKIKO_RENDER_API=SOFTWARE
export LIBGL_ALWAYS_SOFTWARE=1
export VLC_DISABLE_HW_ACCEL=1
exec /opt/simpmusic/squashfs-root/AppRun "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/simpmusic"

    # 4. Installa icone e desktop file
    install -Dm644 squashfs-root/simpmusic.desktop "${pkgdir}/usr/share/applications/simpmusic.desktop"
    install -Dm644 squashfs-root/simpmusic.png "${pkgdir}/usr/share/pixmaps/simpmusic.png"
}
