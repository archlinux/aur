# Maintainer: lucial <bordiyan20035@gmail.com>
pkgname=steampipe-gui
pkgver=1.1.3
pkgrel=1
pkgdesc="A PyQt6 GUI for managing and uploading builds via SteamPipe (steamcmd)"
arch=('any')
url="https://github.com/Lucia7Lunadottir/SteamPipeGUI-Linux"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6')
optdepends=(
    'steamcmd: standalone steamcmd (from AUR)'
    'steamworks-sdk: full Steamworks SDK with steamcmd included'
)
# Steamworks SDK (требует аккаунт Steamworks Partner):
# https://partner.steamgames.com/downloads/steamworks_sdk.zip
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname/steam-pipe-gui"

    # Директория приложения
    install -dm755 "$pkgdir/opt/$pkgname"

    # Python-скрипты
    install -m644 main.py            "$pkgdir/opt/$pkgname/"
    install -m644 main_window.py     "$pkgdir/opt/$pkgname/"
    install -m644 app_config.py      "$pkgdir/opt/$pkgname/"
    install -m644 depot_manager.py   "$pkgdir/opt/$pkgname/"
    install -m644 steamcmd_wrapper.py "$pkgdir/opt/$pkgname/"

    # Иконка
    install -m644 steampipe-gui-logo.png "$pkgdir/opt/$pkgname/"
    install -Dm644 steampipe-gui-logo.png "$pkgdir/usr/share/pixmaps/steampipe-gui-logo.png"

    # .desktop-файл
    install -Dm644 steampipe-gui.desktop "$pkgdir/usr/share/applications/steampipe-gui.desktop"

    # Лаунчер в /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/bash
exec python3 /opt/steampipe-gui/main.py "$@"
LAUNCHER
}
