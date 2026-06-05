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
    # 1. Installa i binari in /opt
    install -dm755 "${pkgdir}/opt/simpmusic"
    cp -r squashfs-root "${pkgdir}/opt/simpmusic/"

    # 2. Crea lo script wrapper (Fix Wayland)
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

    # 3. Installa Desktop File
    install -Dm644 squashfs-root/simpmusic.desktop "${pkgdir}/usr/share/applications/simpmusic.desktop"
    
    # 4. Installa l'icona correttamente
    install -Dm644 squashfs-root/simpmusic.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/simpmusic.png"
    
    # 5. Correggi il riferimento nel desktop file
    sed -i 's|^Icon=.*|Icon=simpmusic|' "${pkgdir}/usr/share/applications/simpmusic.desktop"
    sed -i 's|^Exec=.*|Exec=simpmusic|' "${pkgdir}/usr/share/applications/simpmusic.desktop"
}
