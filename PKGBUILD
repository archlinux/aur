# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-tray-git
pkgver=0.2.5
pkgrel=1
pkgdesc="System tray application for RClone BiSync Manager"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'rclone-bisync-manager-git=0.2.5' 'python-pillow' 'python-pystray' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e5bc4b455353728432dff50b7160a455eb4f04569cd48b7ecc90d9f83f8b8d4')

build() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    cp pyproject.tray.toml pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Remove files that conflict with the main package
    rm -rf "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager"
    rm -f "$pkgdir/usr/bin/rclone-bisync-manager"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 desktop/rclone-bisync-manager-tray.desktop "$pkgdir/usr/share/applications/rclone-bisync-manager-tray.desktop"
    install -Dm644 desktop/rclone-bisync-manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rclone-bisync-manager.svg"
}
