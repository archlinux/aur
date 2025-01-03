# Maintainer: kirik
pkgname=varchiver
pkgver=0.2.3
pkgrel=1
pkgdesc="Advanced Archive Management Tool with modern UI"
arch=('any')
url="https://github.com/instancer-kirik/varchiver"
license=('custom:proprietary')
depends=(
    'python'
    'python-pyqt6'
    'python-poetry'
    'python-psutil'
    'p7zip'
    'rar'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc8b3eb3b09153a5ec668fc2a80b8732d75e91d9e2c7fda74b4ee88d0c4160a6')

build() {
    cd "$pkgname-$pkgver"
    poetry config virtualenvs.create false
    poetry install --no-dev
}

package() {
    cd "$pkgname-$pkgver"
    poetry build
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 "varchiver.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon
    install -Dm644 "varchiver.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # Install license
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
