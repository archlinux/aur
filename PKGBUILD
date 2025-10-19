# Maintainer: Your Name <ezrakhuzadi@gmail.com>
pkgname=bluetooth-bitrate-manager
pkgver=0.1.0.r2.g6b63572
pkgrel=1
pkgdesc="GTK4 app and CLI that monitor PipeWire Bluetooth codecs with an optional high-bitpool SBC rebuild"
arch=('any')
url="https://github.com/ezrakhuzadi/bluetooth-bitrate-manager"
license=('MIT')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
)
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'pipewire'
    'wireplumber'
)
optdepends=(
    'pipewire-pulse: provides pactl for bitrate detection (alternative: pulseaudio)'
    'pulseaudio: provides pactl if pipewire-pulse is not used'
    'git: rebuild the SBC high-bitpool codec from the GUI'
    'meson: rebuild the SBC high-bitpool codec from the GUI'
    'ninja: rebuild the SBC high-bitpool codec from the GUI'
    'gcc: rebuild the SBC high-bitpool codec from the GUI'
    'pkgconf: rebuild the SBC high-bitpool codec from the GUI'
    'curl: fetch gdbus-codegen helper when rebuilding the SBC codec'
)
provides=('bluetooth-audio-boost')
conflicts=('bluetooth-audio-boost')
source=("git+https://github.com/ezrakhuzadi/bluetooth-bitrate-manager.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    set +o pipefail
    local desc
    desc=$(git describe --long --tags --abbrev=7 2>/dev/null) || desc=""
    if [[ -n "$desc" ]]; then
        printf '%s\n' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '0.1.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 bluetooth_bitrate_manager/resources/bluetooth-bitrate-manager.desktop \
        "$pkgdir/usr/share/applications/bluetooth-bitrate-manager.desktop"
}
