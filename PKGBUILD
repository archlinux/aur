# Maintainer: MrHaku81 <haku81.kk@gmail.com>
pkgname=print-ease
pkgver=0.2.2
pkgrel=1
pkgdesc="Find and use printers and scanners instantly - zero config required"
arch=('any')
url="https://github.com/MrHaku81/print-ease"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'gtk4'
    'libadwaita'
    'python-gobject'
    'python-pycups'
    'cups'
    'avahi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
    'gettext'
)
optdepends=(
    'python-pillow: PDF assembly for software duplex ADF scanning'
    'python-zeroconf: printer and scanner discovery without a running Avahi daemon'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MrHaku81/print-ease/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d047816c561500847ba1c316e00a57d0041f006bb3d3e1f44f479d4b0238800')

build() {
    cd "$pkgname-$pkgver"

    # Compile translations (.mo files needed by hatchling artifacts)
    make mo

    # Build wheel (hatchling picks up .mo via artifacts)
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Python wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 data/at.printease.PrintEase.desktop \
        "$pkgdir/usr/share/applications/at.printease.PrintEase.desktop"

    # Scalable SVG icon
    install -Dm644 data/icons/hicolor/scalable/apps/print-ease.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/print-ease.svg"

    # License (Arch convention)
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
