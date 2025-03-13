# Maintainer: quantumvoid0

pkgname=better-control-git
pkgver=0  # Will be updated by pkgver()
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
sha256sums=('SKIP')  # Required for VCS packages

pkgver() {
    cd "$srcdir/better-control"
    
    # Ensure the repository has commits
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1 || [ -z "$(git rev-list --count HEAD 2>/dev/null)" ]; then
        echo "0.r0.g0000000"
    else
        echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/better-control"
    
    # Ensure full commit history is available
    git fetch --unshallow || git fetch --all
}

package() {
    cd "$srcdir/better-control"

    # Ensure the script exists before installing
    install -Dm755 control.py "$pkgdir/usr/bin/control"

    # Install the desktop entry
    install -Dm644 control.desktop "$pkgdir/usr/share/applications/control.desktop"
}

