# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-git
pkgver=0.4.0b3.r2.g3a584c3
pkgrel=1
pkgdesc="A daemon-based solution for automated, bidirectional synchronization of files using RClone (includes system tray)"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'rclone' 'python-croniter-git' 'python-pydantic' 'python-daemon' 'python-yaml' 'python-psutil' 'python-pillow' 'python-gobject' 'python-cairosvg' 'gtk3' 'libappindicator-gtk3' 'libnotify')
optdepends=('cpulimit: for limiting CPU usage of rclone processes')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
install=rclone-bisync-manager.install

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    # Remove invalid trove classifier that causes build failure with Python 3.14+
    sed -i '/"Topic :: System :: Archiving :: Sync"/d' pyproject.toml
}

# Use system Python so venv in PATH does not break the build (python-build, python-installer from pacman).
build() {
    cd "$srcdir/$pkgname"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
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
