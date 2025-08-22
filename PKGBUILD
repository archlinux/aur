# Maintainer: Your Name <you@example.com>
pkgname=dms-git
pkgver=r0.g0000000
pkgrel=2
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=('any')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'quickshell'
    'dgop'
    'ttf-material-symbols-variable-git'
    'inter-font'
    'ttf-fira-code'
)
optdepends=(
    'networkmanager: Required for network management'
    'matugen-bin: Dynamic wallpaper-based theming'
    'brightnessctl: Laptop display brightness control'
    'wl-clipboard: Copy functionality for PIDs and other elements'
    'cliphist: Clipboard history functionality'
    'cava: Audio visualizer'
    'qt5ct: Qt5 application theming'
    'qt6ct: Qt6 application theming'
)
makedepends=('git')
provides=('dms')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    if git describe --tags --long 2>/dev/null | grep -q .; then
        git describe --tags --long | sed 's/^v//; s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install shell files to quickshell config directory
    install -dm755 "$pkgdir/etc/xdg/quickshell/dms"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/dms/README.md"
    cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"

    # Remove git files from installation
    rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
