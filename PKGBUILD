# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.4
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

# Hybride Source-Logik
if [ "$LOCAL_BUILD" = "1" ]; then
    # We skip source fetching and use the current worktree files directly in prepare()
    source=()
sha256sums=('5b375feb9f8e424b182bbc9067b9d39f4bc2ecd0fc1e1959dfae63482274290d')
else
    source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoelliX/NativMix/archive/refs/tags/v${pkgver}.tar.gz")
fi

_enter_source() {
    if [ "$LOCAL_BUILD" = "1" ]; then
        cd "${srcdir}/local_code"
    elif [ -d "${srcdir}/NativMix-${pkgver}" ]; then
        cd "${srcdir}/NativMix-${pkgver}"
    elif [ -d "${srcdir}/nativmix-${pkgver}" ]; then
        cd "${srcdir}/nativmix-${pkgver}"
    else
        echo "FEHLER: Source-Verzeichnis nicht gefunden!"
        exit 1
    fi
}

prepare() {
    if [ "$LOCAL_BUILD" = "1" ]; then
        echo "Lokal-Modus: Kopiere aktuelles Verzeichnis (inkl. uncommitted changes)..."
        mkdir -p "${srcdir}/local_code"
        # Sync all project files, excluding build artifacts and .git
        rsync -a --exclude=".git" --exclude=".venv" --exclude="packaging/aur/src" --exclude="packaging/aur/pkg" \
              --exclude="build" --exclude="dist" --exclude="*.egg-info" \
              "${startdir}/../../" "${srcdir}/local_code/"
    fi

    _enter_source
    rm -rf dist/ build/ *.egg-info .eggs/
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
}

build() {
    _enter_source
    export PIP_NO_CACHE_DIR=1
    python -m build --wheel --no-isolation
}

package() {
    _enter_source

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
