# Maintainer: Your Name <your.email@example.com>
pkgname=staticwall-git
pkgver=0.2.0.r0.gcf99dac
pkgrel=1
pkgdesc="Dynamic Wayland wallpaper manager with live shader support"
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/staticwall"
license=('MIT')
depends=(
    'wayland'
    'egl'
    'glesv2'
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
provides=('staticwall')
conflicts=('staticwall')
source=("git+https://github.com/1ay1/staticwall.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/staticwall"
    # Get version from git tags, with format: TAG.rREVISIONS.gHASH
    # Example: 0.2.0.r12.gabc1234
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/staticwall"
    make
}

package() {
    cd "$srcdir/staticwall"

    # Install binary
    install -Dm755 build/bin/staticwall "$pkgdir/usr/bin/staticwall"

    # Install default config
    install -Dm644 config/staticwall.vibe "$pkgdir/usr/share/staticwall/staticwall.vibe"

    # Install example shaders
    install -dm755 "$pkgdir/usr/share/staticwall/shaders"
    install -m644 examples/shaders/*.glsl "$pkgdir/usr/share/staticwall/shaders/"

    # Install shader README
    install -Dm644 examples/shaders/README.md "$pkgdir/usr/share/staticwall/shaders/README.md"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/staticwall/README.md"
    install -Dm644 docs/CONFIG_GUIDE.md "$pkgdir/usr/share/doc/staticwall/CONFIG_GUIDE.md"
    install -Dm644 docs/SHADERTOY_SUPPORT.md "$pkgdir/usr/share/doc/staticwall/SHADERTOY_SUPPORT.md"
    install -Dm644 docs/ICHANNELS.md "$pkgdir/usr/share/doc/staticwall/ICHANNELS.md"
    install -Dm644 DISPLAY_RECONNECTION.md "$pkgdir/usr/share/doc/staticwall/DISPLAY_RECONNECTION.md"

    # Install license (if you have one)
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
