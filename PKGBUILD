# Maintainer: Oscar Tienda <contacto@oscartienda.com>
pkgname=sunsync
pkgver=0.2.0
pkgrel=1
pkgdesc="Import games from Lutris, Steam, Heroic and other launchers into Sunshine (KDE Plasma Wayland)"
arch=('any')
url="https://github.com/OscarTienda/SunSync"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-pillow'
)
optdepends=(
    'krfb: virtual monitor support (krfb-virtualmonitor)'
    'libkscreen: virtual display mode switching (kscreen-doctor)'
    'qt6-tools: virtual display helpers (qdbus6)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('404ee6caa57be7a01df846aeb8739ef2245e262b332012a903223f2db2694ed6')

build() {
    cd "$srcdir/SunSync-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/SunSync-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 assets/sunsync.desktop "$pkgdir/usr/share/applications/sunsync.desktop"
    install -Dm644 assets/sunsync.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sunsync.svg"

    # Virtual-monitor scripts, also discoverable at /usr/share/sunsync/scripts.
    install -Dm755 scripts/sunshine-start-vmon.sh "$pkgdir/usr/share/sunsync/scripts/sunshine-start-vmon.sh"
    install -Dm755 scripts/sunshine-stop-vmon.sh "$pkgdir/usr/share/sunsync/scripts/sunshine-stop-vmon.sh"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
