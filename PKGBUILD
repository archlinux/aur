# Maintainer: Your Name <your.email@example.com>

pkgname=rclone-bisync-manager-git
pkgver=0.3.9
pkgrel=2
pkgdesc="A daemon-based solution for automated, bidirectional synchronization of files using RClone"
arch=('any')
url="https://github.com/Gunther-Schulz/rclone-bisync-manager"
license=('MIT')
depends=('python>=3.12' 'rclone''python-croniter' 'python-pydantic' 'python-daemon' 'python-yaml' 'python-psutil')
optdepends=('rclone-bisync-manager-tray-git: for tray application' 'cpulimit: for limiting CPU usage of rclone processes')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8138b22f98df0b34a4f7893acca5a815fbe44c7d757bdaa4c673377c07c40413')
install=rclone-bisync-manager.install

build() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rclone-bisync-manager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Remove files that conflict with the main package
    rm -rf "$pkgdir/usr/lib/python3.12/site-packages/rclone_bisync_manager_tray"
    rm -f "$pkgdir/usr/bin/rclone-bisync-manager-tray"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install user service file
    install -Dm644 systemd/rclone-bisync-manager.service "$pkgdir/usr/lib/systemd/user/rclone-bisync-manager.service"

    # Install sample configuration file
    install -Dm644 examples/config.yaml.example "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"
}
