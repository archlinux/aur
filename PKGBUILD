# Maintainer: Your Name <your.email@example.com>
pkgname=neowall-git
pkgver=0.3.0.r0.gcf99dac
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=(
    'wayland'
    'mesa'
    'libpng'
    'libjpeg-turbo'
)
makedepends=(
    'git'
    'make'
    'gcc'
    'wayland-protocols'
    'pkgconf'
)
provides=('neowall')
conflicts=('neowall')
install=neowall.install
source=("git+https://github.com/1ay1/neowall.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/neowall"
    # Try to get version from git tags
    if git describe --long --tags 2>/dev/null | grep -q "^v"; then
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # Fallback: use Makefile version + commit count + short hash
        local makefile_ver=$(grep "^VERSION = " Makefile 2>/dev/null | cut -d' ' -f3)
        local commit_count=$(git rev-list --count HEAD)
        local short_hash=$(git rev-parse --short HEAD)
        printf "%s.r%s.g%s" "${makefile_ver:-0.3.0}" "$commit_count" "$short_hash"
    fi
}

build() {
    cd "$srcdir/neowall"
    make
}

package() {
    cd "$srcdir/neowall"

    # Install binary
    install -Dm755 build/bin/neowall "$pkgdir/usr/bin/neowall"

    # Install configs
    install -Dm644 config/config.vibe "$pkgdir/usr/share/neowall/config.vibe"
    install -Dm644 config/neowall.vibe "$pkgdir/usr/share/neowall/neowall.vibe"

    # Install shaders
    install -dm755 "$pkgdir/usr/share/neowall/shaders"
    install -m644 examples/shaders/*.glsl "$pkgdir/usr/share/neowall/shaders/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
