# Maintainer: Your Name <ezrakhuzadi@gmail.com>
pkgname=bluetooth-bitrate-manager
pkgver=0.3.1
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
    'meson'
    'ninja'
    'gcc'
    'pkgconf'
    'curl'
)
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'glib2'
    'shared-mime-info'
    'adwaita-icon-theme'
    'pipewire'
    'wireplumber'
)
optdepends=(
    'pipewire-pulse: provides pactl for bitrate detection (alternative: pulseaudio)'
    'pulseaudio: provides pactl if pipewire-pulse is not used'
)
provides=('bluetooth-audio-boost')
conflicts=('bluetooth-audio-boost')
source=("git+https://github.com/ezrakhuzadi/bluetooth-bitrate-manager.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.3.1"
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
