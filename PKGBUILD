pkgname=collapseloader-bin
pkgver=0.2.8
pkgrel=2
pkgdesc="GUI utility for launching Minecraft clients"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('squashfs-tools')
provides=('collapseloader')
conflicts=('collapseloader-git')
# Ссылка на пререлиз
source=("collapseloader-${pkgver}_amd64.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/prerelease-v0.2.8-c36dd27/collapseloader_0.2.8_amd64.AppImage")
sha256sums=('SKIP')
noextract=("collapseloader-${pkgver}_amd64.AppImage")

prepare() {
    cd "${srcdir}"
    chmod +x "collapseloader-${pkgver}_amd64.AppImage"

    # Распаковка образа
    ./"collapseloader-${pkgver}_amd64.AppImage" --appimage-extract

    # Удаление конфликтующих библиотек Wayland по просьбе разработчика
    rm -v squashfs-root/usr/lib/*wayland*so* || true
}

package() {
    # Установка бинарника
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"

    # Установка иконки
    if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi

    # Создание .desktop файла
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
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
