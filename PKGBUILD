# Maintainer: Husam Bilal <me@husam.dev>

pkgname=microcontrol-git
pkgver=r3.g7eae6a5
pkgrel=1
pkgdesc="A small GTK control panel for Wayland window managers"
arch=('any')
url="https://github.com/husam212/microcontrol"
license=('GPL-3.0-or-later')
depends=(
    'gtk3' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl'
    'python' 'python-gobject' 'python-dbus'
    'python-qrcode' 'python-setproctitle' 'python-pillow' 'python-psutil'
    'power-profiles-daemon' 'gammastep'
    'kanshi' 'wl-mirror'
)
makedepends=('git')
provides=('microcontrol')
conflicts=('microcontrol')
source=("$pkgname::git+https://github.com/husam212/microcontrol.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -dm755 "$pkgdir/usr/share/microcontrol"
    cp -r src/. "$pkgdir/usr/share/microcontrol/"
    find "$pkgdir/usr/share/microcontrol" -name '__pycache__' -type d -prune -exec rm -rf {} +
    chmod 755 "$pkgdir/usr/share/microcontrol/microcontrol.py"
    python -m compileall -q -d /usr/share/microcontrol "$pkgdir/usr/share/microcontrol"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 /usr/share/microcontrol/microcontrol.py "$@"\n' > "$pkgdir/usr/bin/microcontrol"
    chmod 755 "$pkgdir/usr/bin/microcontrol"

    install -Dm644 src/microcontrol.desktop "$pkgdir/usr/share/applications/microcontrol.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 package/systemd/microcontrol-kanshi.service "$pkgdir/usr/lib/systemd/user/microcontrol-kanshi.service"
}
