# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
pkgname=python-lnxlink
pkgver=2026.2.0
pkgrel=1
pkgdesc="Linux system integration for Home Assistant via MQTT"
arch=('any')
url="https://github.com/bkbilly/lnxlink"
license=('MIT')
depends=(
    'python'
    'python-yaml'
    'python-paho-mqtt-2'
    'python-requests'
    'python-psutil'
    'python-pyinotify'
    'python-jeepney'
    'python-aiohttp'
    'python-distro'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'bluez: Bluetooth device control'
    'grub: Boot menu selection'
    'pulseaudio: Audio control'
    'xorg-xrandr: Screen control'
    'xdotool: Keyboard and mouse control'
    'playerctl: Media player control'
    'systemd: Systemd service support'
)
install=lnxlink.install
source=(
    "https://files.pythonhosted.org/packages/source/l/lnxlink/lnxlink-${pkgver}.tar.gz"
    "lnxlink.service"
    "config.yaml.example"
)
sha256sums=('d6c154e63cfcb55393bd6c75dc9df5ad430496b732d358c857b175a5c66e0d52'
            '05c444cfe4a9816a19211363ac0e91a70c714257ef7c6ef8c4a9faff93313621'
            '3a7ad444095681fc1439f6f969e396668680040b51339c1febdf420f4ef8251a')

build() {
    cd "lnxlink-${pkgver}"
    python -m build --wheel
}

package() {
    cd "lnxlink-${pkgver}"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install systemd user service
    install -Dm644 "$srcdir/lnxlink.service" \
        "$pkgdir/usr/lib/systemd/user/lnxlink.service"

    # Install example configuration
    install -Dm644 "$srcdir/config.yaml.example" \
        "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"

    # Install license
    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
