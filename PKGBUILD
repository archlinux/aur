# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.2
pkgrel=3
pkgdesc="Hardware-assisted volume mixer for PipeWire/PulseAudio with Arduino support"
arch=('any')
url="https://github.com/knoellix/NativMix"
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoellix/NativMix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e4486318d8125219067be42818181f76065d32755401c38a4c3f618dc6382a6')

prepare() {
    cd "${srcdir}/NativMix-${pkgver}"

    # Aufräumen von alten Build-Resten im Source-Ordner
    rm -rf dist build lib/*.egg-info
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
}

build() {
    cd "${srcdir}/NativMix-${pkgver}"
    export PIP_NO_CACHE_DIR=1
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/NativMix-${pkgver}"

    # 1. Installiere das Python Wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # 2. Desktop Eintrag (liegt in deinem 'data' Ordner)
    install -Dm644 data/nativmix.desktop \
        "$pkgdir/usr/share/applications/nativmix.desktop"

    # 3. System-Icons (SVG & PNG)
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/nativmix.svg"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/nativmix.png"

    # 4. App-Assets für die Laufzeit (falls dein Code dort sucht)
    install -d "$pkgdir/usr/share/nativmix/assets"
    install -m644 assets/icon.png "$pkgdir/usr/share/nativmix/assets/icon.png"
    install -m644 assets/icon.svg "$pkgdir/usr/share/nativmix/assets/icon.svg"

    # 5. Lizenz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
