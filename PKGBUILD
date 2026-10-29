# Maintainer: Joy Jasper <0x73757375@gmail.com>
# Contributor: Ahmed Saad
pkgname=g502-hub
pkgver=0.2.1
pkgrel=1
pkgdesc="Unofficial G HUB alternative for the Logitech G502 HERO: DPI, lighting, buttons, macros, profiles and game rules"
arch=('any')
url="https://github.com/Ahmedxsaad/g502-hub"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'python-numpy' 'python-gobject' 'python-dbus-fast' 'python-evdev'
         'libxkbcommon' 'gstreamer' 'gst-plugins-base' 'gst-plugin-pipewire' 'libpulse')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'clang' 'llvm' 'lld')
checkdepends=('python-pytest')
optdepends=('steam: game detection, cover art colors and the LIGHTSYNC bridge for Proton games')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    sh bridge/logitechled/build.sh   # LogitechLed.dll for Proton games (Windows DLLs, built with clang)
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    # The parts that need no mouse, desktop session or D-Bus
    python -m pytest -q tests/test_onboard.py tests/test_lightfx.py tests/test_rules.py tests/test_sharing.py
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 udev/70-g502-hub.rules "$pkgdir/usr/lib/udev/rules.d/70-g502-hub.rules"
    install -Dm644 packaging/g502-hub.desktop "$pkgdir/usr/share/applications/g502-hub.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
