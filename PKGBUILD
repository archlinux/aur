# Maintainer: Your Name <you@example.com>
pkgname=dms-shell-bin
pkgver=0.0.29
pkgrel=3
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=('x86_64' 'aarch64')
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
conflicts=('dms-shell-git' 'dms-shell' 'dms-git')

# Version for the dms CLI binary from danklinux
_dms_cli_ver=v$pkgver

# Map architecture names
_get_arch() {
    case "$1" in
        x86_64)
            echo "amd64"
            ;;
        aarch64)
            echo "arm64"
            ;;
        *)
            echo "unsupported"
            ;;
    esac
}

# Sources for each architecture
source_x86_64=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "dms-${_dms_cli_ver}-amd64.gz::https://github.com/AvengeMedia/danklinux/releases/download/${_dms_cli_ver}/dms-amd64.gz"
)
source_aarch64=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "dms-${_dms_cli_ver}-arm64.gz::https://github.com/AvengeMedia/danklinux/releases/download/${_dms_cli_ver}/dms-arm64.gz"
)

# Checksums - replace SKIP with actual checksums using 'makepkg -g'
sha256sums_x86_64=(
    'SKIP'  # DankMaterialShell tarball
    'SKIP'  # dms binary for amd64
)
sha256sums_aarch64=(
    'SKIP'  # DankMaterialShell tarball
    'SKIP'  # dms binary for arm64
)

prepare() {
    # Extract the dms binary
    local _arch=$(_get_arch "${CARCH}")
    cd "${srcdir}"
    
    if [ -f "dms-${_dms_cli_ver}-${_arch}.gz" ]; then
        gunzip -f "dms-${_dms_cli_ver}-${_arch}.gz"
    fi
}

package() {
    # Install the dms binary
    local _arch=$(_get_arch "${CARCH}")
    install -Dm755 "${srcdir}/dms-${_dms_cli_ver}-${_arch}" "$pkgdir/usr/bin/dms"
    
    # Install shell files from DankMaterialShell
    cd "${srcdir}/DankMaterialShell-${pkgver}"
    
    # Install shell files to quickshell config directory
    install -dm755 "$pkgdir/etc/xdg/quickshell/dms"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/dms/README.md"
    if [ -d "./docs" ]; then
        install -dm755 "$pkgdir/usr/share/doc/dms/"
        cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"
    fi
    
    # Remove any git files that might be in the tarball
    rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
