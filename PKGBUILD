# Maintainer: quantumvoid0

pkgname=better-control-git
pkgver=0.r57.gd505b13  # Will be updated dynamically
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/your-repo/better-control"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/your-repo/better-control.git")
sha256sums=('SKIP')  # Required for VCS packages

pkgver() {
    cd "$srcdir/better-control"
    if [ ! -d .git ] || ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "0.r0.g0000000"
        return
    fi
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/better-control"
    # Ensure full commit history is available
    if git rev-parse --is-shallow-repository >/dev/null 2>&1; then
        git fetch --unshallow || true
    fi
    git fetch --all
}

package() {
    cd "$srcdir/better-control"

    # Install main script
    install -Dm755 src/control.py "$pkgdir/usr/bin/control"

    # Install desktop entry
    install -Dm644 src/control.desktop "$pkgdir/usr/share/applications/control.desktop"

    # Install icons if available
    if [ -d "src/icons" ]; then
        install -Dm644 src/icons/* "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
    fi
}

