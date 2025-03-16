# Maintainer: quantumvoid0

pkgname=better-control-git
pkgver=0.r57.gd505b13  # Will be updated by pkgver()
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL-3.0-only')
depends=('gtk4' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-pydbus' 'python' 'cpupower')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git#branch=main")
sha256sums=('SKIP')  # Required for VCS packages

pkgver() {
    cd "$srcdir/better-control"

    # Ensure the repository is valid
    if [ ! -d .git ] || ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "0.r0.g0000000"
        return
    fi

    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/better-control"

    # Check if the repo is shallow before attempting --unshallow
    if git rev-parse --is-shallow-repository >/dev/null 2>&1; then
        git fetch --unshallow || git fetch --all
    else
        git fetch --all
    fi
}

package() {
    cd "$srcdir/better-control/src"

    # Check for required files before installing
    if [ ! -f "control.py" ]; then
        echo "ERROR: src/control.py not found!"
        exit 1
    fi

    install -Dm755 "control.py" "$pkgdir/usr/bin/control"

    if [ ! -f "control.desktop" ]; then
        echo "ERROR: src/control.desktop not found!"
        exit 1
    fi

    install -Dm644 "control.desktop" "$pkgdir/usr/share/applications/control.desktop"

    install -Dm644 "$srcdir/better-control/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

