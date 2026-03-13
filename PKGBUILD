pkgname=collapseloader-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="GUI utility for launching Minecraft clients (binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader-${pkgver}_amd64.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/0.2.8/collapseloader_0.2.8_amd64.AppImage")
sha256sums=('5af192eadc84fb57bd3688b11ab9ea097939f2cb7b9a15a488837b2b83ad8c43')
noextract=("collapseloader-${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/collapseloader-${pkgver}_amd64.AppImage"
    cd "${srcdir}"
    "${srcdir}/collapseloader-${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"

    if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=0.2.8
Type=Application
Name=CollapseLoader
Comment=A user-friendly loader for many minecraft clients
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
}
