# Maintainer: quantumvoid0

pkgname=better-control-git
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL-3.0-only')
depends=('gtk4' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-pydbus' 'python')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/better-control"

    # Ensure there are commits before running git commands
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "0.r0.g0000000"
    else
        echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/better-control"
    git fetch --unshallow || true  # Ensure full commit history is available
}

package() {
    cd "$srcdir/better-control"

    # Install the main executable
    install -Dm755 src/control.py "$pkgdir/usr/bin/control"
    chmod +x "$pkgdir/usr/bin/control"

    # Install the desktop entry
    install -Dm644 src/control.desktop "$pkgdir/usr/share/applications/control.desktop"
}

