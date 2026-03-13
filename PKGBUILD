# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.5
pkgrel=2
pkgdesc="Hardware-based PipeWire volume & MIDI mixer for Wayland. Controls physical inputs, virtual sinks, and MIDI devices. (Modern deej alternative)"
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
    'git'
)

optdepends=(
    'kvantum: Plasma transparency and blur engine support'
)

# Removed auto-build logic
install=nativmix.install

# Hybride Source-Logik entfernt - Dies ist nun das offizielle PKGBUILD
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoelliX/NativMix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f747c8b78791d5c8c8ab685f8bedbede1a4ead5d7ee4fd9ca9b742137d30bbb4')

prepare() {
    # Find extracted directory (GitHub tags prepends 'NativMix-' or 'nativmix-')
    if [ -d "${srcdir}/NativMix-${pkgver}" ]; then
        cd "${srcdir}/NativMix-${pkgver}"
    else
        cd "${srcdir}/nativmix-${pkgver}"
    fi

    rm -rf dist/ build/ *.egg-info .eggs/
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
}

build() {
    if [ -d "${srcdir}/NativMix-${pkgver}" ]; then
        cd "${srcdir}/NativMix-${pkgver}"
    else
        cd "${srcdir}/nativmix-${pkgver}"
    fi

    export PIP_NO_CACHE_DIR=1
    python -m build --wheel --no-isolation
}

package() {
    if [ -d "${srcdir}/NativMix-${pkgver}" ]; then
        cd "${srcdir}/NativMix-${pkgver}"
    else
        cd "${srcdir}/nativmix-${pkgver}"
    fi

    # 1. Install Python wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # 2. Desktop entries
    install -Dm644 data/nativmix.desktop \
        "$pkgdir/usr/share/applications/nativmix.desktop"
    
    install -Dm644 data/nativmix.desktop \
        "$pkgdir/etc/xdg/autostart/nativmix.desktop"

    # 3. Systemd User Unit
    if [ -f "packaging/nativmix.service" ]; then
        install -Dm644 packaging/nativmix.service \
            "$pkgdir/usr/lib/systemd/user/nativmix.service"
    fi

    # 4. Hardware Access (udev rules)
    install -Dm644 data/udev/99-nativmix-arduino.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-nativmix-arduino.rules"

    # 5. Icons & Assets
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/nativmix.svg"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/nativmix.png"

    install -d "$pkgdir/usr/share/nativmix/assets"
    install -m644 assets/icon.png "$pkgdir/usr/share/nativmix/assets/icon.png"
    install -m644 assets/icon.svg "$pkgdir/usr/share/nativmix/assets/icon.svg"

    # 6. License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
