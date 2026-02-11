# Maintainer: Steven de Jong <steven@example.com>
pkgname=pep
pkgver=0.0.3
pkgrel=1
pkgdesc="Lightweight system tray keep-awake tool using systemd-inhibit"
arch=('any')
url="https://github.com/stevendejongnl/pep"
license=('MIT')
install=pep.install
depends=('python' 'python-gobject' 'libayatana-appindicator')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fea14a20010390fbe4b575450f98bd28ffd7a5ae45d464fd8e1f074d850a1a18')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install icons to system icon theme
    install -Dm644 icons/pep-pill-full.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/pep-pill-full.svg"
    install -Dm644 icons/pep-pill-empty.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/pep-pill-empty.svg"

    # Install systemd user service
    install -Dm644 pep.service \
        "$pkgdir/usr/lib/systemd/user/pep.service"

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
