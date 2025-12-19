pkgname=collapseloader-bin
pkgver=0.2.5
pkgrel=4
pkgdesc="GUI utility for launching Minecraft clients (binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader-${pkgver}_amd64.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/${pkgver}/collapseloader_${pkgver}_amd64.AppImage")
sha256sums=('b8dd25756a3938386ea7bf5fc7e56c3eeb73f087ee4968512090c17efda44e60')
noextract=("collapseloader-${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/collapseloader-${pkgver}_amd64.AppImage"
    cd "${srcdir}"
    "${srcdir}/collapseloader-${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"

    # Установка иконки (ищем в разных местах)
    if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
}
