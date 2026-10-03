# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=telegram-drive-appimage
pkgver=3.9.8
pkgrel=2
pkgdesc="Turn your Telegram account into an unlimited, secure cloud storage drive (from AppImage)"
arch=('x86_64')
url="https://github.com/caamer20/Telegram-Drive"
license=('LicenseRef-Upstream-Unspecified')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=('squashfs-tools')
optdepends=(
    'ffmpeg: HLS media transcoding'
    'gnome-keyring: persistent credential storage'
)
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/caamer20/Telegram-Drive/releases/download/v${pkgver}/Telegram.Drive_${pkgver}_amd64.AppImage"
        "LICENSE::https://raw.githubusercontent.com/caamer20/Telegram-Drive/v${pkgver}/packaging/arch/UPSTREAM-LICENSE-NOTICE")
sha256sums=('07c6dc2d0ab59bbf5a1f2449da54c8a259dc1a638bb09d9e5ccb87052c365041'
            '164994ae2a66a7215deca4a6ebf5822cc1d67737c5c1e1ba2f32b28016e0d6fb')

prepare() {
    cp -L "${srcdir}/${pkgname}-${pkgver}.AppImage" "${srcdir}/real-appimage"
    chmod +x "${srcdir}/real-appimage"
    "${srcdir}/real-appimage" --appimage-extract >/dev/null 2>&1
}

package() {
    cd "${srcdir}/squashfs-root"

    # Ставим сам бинарник из AppImage, а не AppImage-рантайм.
    # Внутри AppImage вшиты свои GTK/WebKit: на части систем (в т.ч. без
    # аппаратного GL) WebKit не инициализируется ("Could not create default
    # EGL display") и окно остаётся пустым тёмным прямоугольником.
    # Бинарник же линкуется динамически и отлично работает с системными
    # библиотеками — так же, как и upstream .deb/.rpm-пакеты.
    install -Dm755 "usr/bin/app" "${pkgdir}/usr/lib/telegram-drive/app"

    local icon
    while IFS= read -r -d '' icon; do
        install -Dm644 "${icon}" \
            "${pkgdir}/${icon/apps\/app.png/apps\/com.cameronamer.telegramdrive.png}"
    done < <(find usr/share/icons/hicolor -type f -path '*/apps/app.png' -print0)

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/telegram-drive" << 'EOF'
#!/bin/sh
# Pacman владеет установкой: приложение может проверять обновления,
# но не должно менять файлы в /usr через self-updater Tauri.
export TELEGRAM_DRIVE_PACKAGE_MANAGER=pacman
exec /usr/lib/telegram-drive/app "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/telegram-drive"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/com.cameronamer.telegramdrive.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Telegram Drive
Comment=Browse and manage files stored in your Telegram account
Exec=telegram-drive
Icon=com.cameronamer.telegramdrive
Terminal=false
Categories=Network;FileTransfer;Utility;
StartupWMClass=app
StartupNotify=true
EOF

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}