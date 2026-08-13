# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.15
pkgrel=1
pkgdesc="Hardware-based PipeWire volume & MIDI mixer for Linux. Controls physical Arduino faders, virtual sinks, and MIDI devices."
arch=('any')
url="https://github.com/knoelliX/NativMix"
license=('GPL-3.0-or-later')
provides=('nativmix')
conflicts=('nativmix-git')

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
    'breeze: Breeze Qt style for native KDE appearance'
    'qt6-wayland: Wayland compositor support'
)

install=nativmix.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoelliX/NativMix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d09262cf5917bf22976d1e149eea56991bce3c44101b41080f68565f0912772')

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
    # NOTE: No /etc/xdg/autostart/ — autostart is opt-in via the settings panel
    # (systemd user service or ~/.config/autostart/), not forced system-wide.

    # 3. Systemd User Unit
    if [ -f "packaging/app-nativmix.service" ]; then
        install -Dm644 packaging/app-nativmix.service \
            "$pkgdir/usr/lib/systemd/user/app-nativmix.service"
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
