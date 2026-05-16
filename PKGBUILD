# Maintainer: Your Name <your.email@example.com>
# Contributor: Your Name <your.email@example.com>

pkgname=piperdc-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern RDP Connection Manager for Linux"
arch=('x86_64')
url="https://github.com/Darius662/PipeRDC"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'freerdp' 'python-gobject' 'python-secretstorage')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4ed6b07c5cc7835db43a2d41e80c547f93c3ebdef2a3467c8ccbe9077be79ada')

package() {
    # Locate the extracted source directory (GitHub archives may use the repo's case-sensitive name)
    src_extracted=$(find "$srcdir" -maxdepth 1 -type d -name "*-$pkgver" -print -quit)
    if [ -z "$src_extracted" ]; then
        cd "$srcdir/piperdc-$pkgver"
    else
        cd "$src_extracted"
    fi

    # Install Python package
    python -m build --wheel --outdir dist
    python -m installer --prefix=/usr --destdir="$pkgdir" dist/*.whl

    # Install desktop file
    install -Dm644 data/piperdc.desktop "$pkgdir/usr/share/applications/piperdc.desktop"

    # Install icon
    install -Dm644 data/icons/piperdc.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/piperdc.svg"

    # Create symlink for CLI
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/usr/bin/piperdc" "$pkgdir/usr/bin/piperdc"
}