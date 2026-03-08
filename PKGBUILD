# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.2
pkgrel=1
pkgdesc="Hardware-assisted volume mixer for PipeWire/PulseAudio with Arduino support"
arch=('any')
url="https://github.com/knoelliX/NativMix"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-pulsectl'
    'python-pyserial'
    'python-setproctitle'
    'python-mido'
    'python-rtmidi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'kvantum: Plasma transparency and blur engine support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoellix/nativmix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e4486318d8125219067be42818181f76065d32755401c38a4c3f618dc6382a6')

prepare() {
    # Clean previous build artifacts so the wheel always reflects current source
    rm -rf "$srcdir/../dist" "$srcdir/../build" "$srcdir/../lib/nativmix.egg-info" "$srcdir/../.eggs"
    find "$srcdir/.." -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
    find "$srcdir/.." -type f -name "*.pyc" -delete 2>/dev/null || true
}

build() {
    cd "$srcdir/.."
    export PIP_NO_CACHE_DIR=1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/.."

    # Install the Python wheel system-wide via PEP 517 installer
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 data/nativmix.desktop \
        "$pkgdir/usr/share/applications/nativmix.desktop"

    # Scalable icon (SVG) for icon themes
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/nativmix.svg"

    # Pixel icon (256x256 PNG) for icon themes
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/nativmix.png"

    # Application assets used at runtime via paths.py
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/nativmix/assets/icon.png"
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/nativmix/assets/icon.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
