pkgname=wallselector-kde
pkgver=1.0.0
pkgrel=1
pkgdesc="A Qt-based wallpaper carousel and selector for KDE Plasma 6"
arch=('any')
url="https://github.com/local/wallselector-kde"
license=('GPL3')
depends=('python' 'python-pyqt6' 'ffmpeg' 'qt6-wayland' 'plasma-workspace')
install='wallselector-kde.install'
source=('wallselector_kde.py'
        'wallselector_kde.svg'
        'wallselector-kde.install')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -dm755 "$pkgdir/opt/wallselector-kde/app"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/etc/xdg/autostart"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Копируем из $srcdir (куда makepkg поместит исходники)
    cp "$srcdir/wallselector_kde.py" "$pkgdir/opt/wallselector-kde/app/wallselector_kde.py"
    chmod +x "$pkgdir/opt/wallselector-kde/app/wallselector_kde.py"

    ln -s /opt/wallselector-kde/app/wallselector_kde.py "$pkgdir/usr/bin/wallselector_kde"

    if [ -f "$srcdir/wallselector_kde.svg" ]; then
        cp "$srcdir/wallselector_kde.svg" "$pkgdir/usr/share/pixmaps/wallselector_kde.svg"
    fi

    # Ярлык для меню Пуск
    echo "[Desktop Entry]
Name=Wallselector KDE
Comment=Select Wallpapers
Exec=wallselector_kde
Icon=wallselector_kde
Terminal=false
Type=Application
Categories=Settings;DesktopSettings;" > "$pkgdir/usr/share/applications/wallselector_kde.desktop"

    # Ярлык для автозагрузки сервиса
    echo "[Desktop Entry]
Name=Wallselector KDE Daemon
Exec=wallselector_kde --hidden
Type=Application
Terminal=false
X-KDE-autostart-phase=2" > "$pkgdir/etc/xdg/autostart/wallselector_kde_daemon.desktop"
}
