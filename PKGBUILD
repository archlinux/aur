# Maintainer: Alex <your-email@domain.com>
pkgname=axiom-git
pkgver=2.0.1.r1.g7677325
pkgrel=1
pkgdesc="A professional Wayland compositor with GPU-accelerated effects and advanced window management"
arch=('x86_64')
url="https://github.com/GeneticxCln/Axiom"
license=('GPL-3.0-or-later')
depends=('wayland' 'wlroots0.19' 'libxkbcommon' 'glibc')
makedepends=('git' 'meson' 'ninja' 'gcc')
optdepends=(
    'waybar: status bar integration'
    'rofi: application launcher'
    'alacritty: recommended terminal emulator'
    'foot: lightweight terminal emulator'
    'kitty: GPU-accelerated terminal emulator'
)
provides=('axiom')
conflicts=('axiom')
source=("${pkgname}::git+https://github.com/GeneticxCln/Axiom.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    
    # Generate required protocol headers
    wayland-scanner server-header \
        /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
        xdg-shell-protocol.h
}

build() {
    cd "$pkgname"
    
    # Configure with meson
    arch-meson build \
        -Doptimization=3
    
    # Build
    meson compile -C build
}

check() {
    cd "$pkgname"
    
    # Run test suite
    meson test -C build --print-errorlogs
}

package() {
    cd "$pkgname"
    
    # Install binary and files
    meson install -C build --destdir="$pkgdir"
    
    # Install example configurations
    install -Dm644 examples/axiom.conf "$pkgdir/etc/axiom/axiom.conf"
    install -Dm644 examples/rules.conf "$pkgdir/etc/axiom/rules.conf"
    
    # Install documentation if it exists
    [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    [[ -f CONTRIBUTING.md ]] && install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    
    # Install license if it exists
    [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install desktop session files (already handled by meson install)
    # They go to /usr/share/wayland-sessions/
}
