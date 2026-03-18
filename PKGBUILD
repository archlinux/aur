# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.6
pkgrel=1
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
sha256sums=('5419007501178c27c70ae864ee50d9e254bd8990e36961350c93b0983f6745af')

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
