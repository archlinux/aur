# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-tray-git
pkgver=0.3.12
pkgrel=1
pkgdesc="System tray application for RClone BiSync Manager"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'tk' 'python-pillow' 'python-pystray' 'python-gobject' 'python-cairosvg' "rclone-bisync-manager-git>=${pkgver}")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63a881df4bfd2343b964b1789ce5b510d523960169849a75b49434641fc29079')

build() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m build --wheel --no-isolation -C pyproject.tray.toml
}

package() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop file and icon
    install -Dm644 desktop/rclone-bisync-manager-tray.desktop "$pkgdir/usr/share/applications/rclone-bisync-manager-tray.desktop"
    install -Dm644 desktop/rclone-bisync-manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rclone-bisync-manager.svg"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Remove files that conflict with the main package
    rm -rf "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager"
    rm -f "$pkgdir/usr/bin/rclone-bisync-manager"

    # Rename dist-info directory to avoid conflicts
    for dir in "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager-"*; do
        if [ -d "$dir" ]; then
            mv "$dir" "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-$pkgver.dist-info"
            break
        fi
    done

    # Keep only tray-specific Python files
    if [ -d "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-"* ]; then
        mv "$pkgdir"/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-*/* "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray/"
        rm -rf "$pkgdir"/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-*
    fi

    # Update RECORD file in the renamed dist-info directory
    if [ -f "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-$pkgver.dist-info/RECORD" ]; then
        sed -i 's/rclone_bisync_manager-/rclone_bisync_manager_tray-/g' "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray-$pkgver.dist-info/RECORD"
    fi
}
