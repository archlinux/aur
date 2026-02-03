# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-git
pkgver=0.4.0b2
pkgrel=1
pkgdesc="A daemon-based solution for automated, bidirectional synchronization of files using RClone (includes system tray)"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'rclone' 'python-croniter-git' 'python-pydantic' 'python-daemon' 'python-yaml' 'python-psutil' 'python-pillow' 'python-gobject' 'python-cairosvg')
optdepends=('cpulimit: for limiting CPU usage of rclone processes' 'libappindicator: system tray icon (needed on KDE/minimal)' 'gtk3: status window and config editor (needed on KDE/minimal)' 'libnotify: tray notifications (needed on KDE/minimal)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('872b37adaeda0f20cd17b9e2d3510ecd5f0d2890390a65c2301a268c71a75f79')
install=rclone-bisync-manager.install

# Use system Python so venv in PATH does not break the build (python-build, python-installer from pacman).
build() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install user service file
    install -Dm644 systemd/rclone-bisync-manager.service "$pkgdir/usr/lib/systemd/user/rclone-bisync-manager.service"

    # Install sample configuration file
    install -Dm644 examples/config.yaml.example "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"

    # Install tray desktop file and icon (tray is part of main app)
    install -Dm644 desktop/rclone-bisync-manager-tray.desktop "$pkgdir/usr/share/applications/rclone-bisync-manager-tray.desktop"
    install -Dm644 desktop/rclone-bisync-manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rclone-bisync-manager.svg"
}
