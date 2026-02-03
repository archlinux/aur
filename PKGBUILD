# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-git
pkgver=0.4.0b1
pkgrel=2
pkgdesc="A daemon-based solution for automated, bidirectional synchronization of files using RClone (includes system tray)"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'rclone' 'python-croniter' 'python-pydantic' 'python-daemon' 'python-yaml' 'python-psutil' 'python-pillow' 'python-gobject' 'python-cairosvg')
optdepends=('cpulimit: for limiting CPU usage of rclone processes' 'libappindicator: system tray icon (needed on KDE/minimal)' 'gtk3: status window and config editor (needed on KDE/minimal)' 'libnotify: tray notifications (needed on KDE/minimal)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63a881df4bfd2343b964b1789ce5b510d523960169849a75b49434641fc29079')
install=rclone-bisync-manager.install

# Follow Arch Wiki Python guidelines: no hardcoded site-packages or python3.X;
# python -m build / python -m installer use the active interpreter's paths.
build() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install user service file
    install -Dm644 systemd/rclone-bisync-manager.service "$pkgdir/usr/lib/systemd/user/rclone-bisync-manager.service"

    # Install sample configuration file
    install -Dm644 examples/config.yaml.example "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"

    # Install tray desktop file and icon (tray is part of main app)
    install -Dm644 desktop/rclone-bisync-manager-tray.desktop "$pkgdir/usr/share/applications/rclone-bisync-manager-tray.desktop"
    install -Dm644 desktop/rclone-bisync-manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rclone-bisync-manager.svg"
}
