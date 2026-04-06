# Maintainer: Ricky Banks <your@email.com>
pkgname=niri-display-manager
pkgver=0.3.1
pkgrel=1
pkgdesc="GUI display manager for the Niri Wayland window manager"
arch=('x86_64' 'aarch64')
url="https://github.com/rickycbanks/niri_display_manager"
license=('MIT')
depends=(
    'python>=3.12'
    'pyside6'
    'python-pyudev'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'niri: the Wayland compositor this tool manages'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('acf443b80c85c70ac43eccf4fa4d9eddb924e74c412b06318510a36ac16d211a')

build() {
    cd "niri_display_manager-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "niri_display_manager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # QML files → standard data directory
    install -dm755 "$pkgdir/usr/share/niri-display-manager"
    cp -r qml "$pkgdir/usr/share/niri-display-manager/"

    # Desktop entry
    install -Dm644 packaging/flatpak/io.github.rickycbanks.NiriDisplayManager.desktop \
        "$pkgdir/usr/share/applications/io.github.rickycbanks.NiriDisplayManager.desktop"

    # App icon
    install -Dm644 assets/icons/niri-display-manager.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.rickycbanks.NiriDisplayManager.svg"

    # Systemd user service
    install -Dm644 packaging/systemd/niri-display-manager-daemon.service \
        "$pkgdir/usr/lib/systemd/user/niri-display-manager-daemon.service"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
