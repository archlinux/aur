# Maintainer: SwitchBros <switchbros@proton.me>
pkgname=steam-library-manager
pkgver=1.1.1
pkgrel=1
pkgdesc="A powerful Steam library organizer for Linux - the modern Depressurizer alternative"
arch=('any')
url="https://github.com/Switch-Bros/SteamLibraryManager"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-psutil'
    'python-pillow'
    'python-opencv'
    'python-vdf'
    'python-yaml'
    'python-beautifulsoup4'
    'python-lxml'
    'python-requests'
    'python-requests-oauthlib'
    'python-qrcode'
    'python-steam'
    'python-protobuf'
    'python-pywebview'
    'python-packaging'
    'qt6-base'
)
optdepends=(
    'python-keyring: secure token storage via system keyring'
    'python-steamgriddb: artwork browsing via SteamGridDB'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5bc98c7a48a8251a0405dbf07196e00fd3ebd64335642fe8a206be4f0deec765')

package() {
    cd "SteamLibraryManager-$pkgver"

    # Install application to /usr/lib/steam-library-manager/
    local _instdir="$pkgdir/usr/lib/$pkgname"
    install -d "$_instdir"
    cp -r src resources requirements-user.txt "$_instdir/"

    # Create launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'LAUNCHER'
#!/bin/sh
exec python /usr/lib/steam-library-manager/src/main.py "$@"
LAUNCHER

    # Desktop entry
    install -Dm644 flatpak/io.github.switch_bros.SteamLibraryManager.desktop \
        "$pkgdir/usr/share/applications/io.github.switch_bros.SteamLibraryManager.desktop"
    sed -i "s|^Exec=steam-library-manager|Exec=$pkgname|" \
        "$pkgdir/usr/share/applications/io.github.switch_bros.SteamLibraryManager.desktop"

    # Icons
    install -Dm644 resources/icon.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 resources/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.switch_bros.SteamLibraryManager.svg"

    # Metainfo (for GNOME Software / KDE Discover)
    install -Dm644 resources/io.github.switch_bros.SteamLibraryManager.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.switch_bros.SteamLibraryManager.metainfo.xml"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
