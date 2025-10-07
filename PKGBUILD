# Maintainer: Your Name <you@example.com>
pkgname=dms-shell-bin
pkgver=0.1.1
pkgrel=1
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

_dms_cli_ver=v$pkgver

_get_arch() {
    case "$1" in
        x86_64) echo "amd64" ;;
        aarch64) echo "arm64" ;;
        *) echo "unsupported" ;;
    esac
}

source_x86_64=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "dms-${_dms_cli_ver}-amd64.gz::https://github.com/AvengeMedia/DankMaterialShell/releases/download/${_dms_cli_ver}/dms-amd64.gz"
)
source_aarch64=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "dms-${_dms_cli_ver}-arm64.gz::https://github.com/AvengeMedia/DankMaterialShell/releases/download/${_dms_cli_ver}/dms-arm64.gz"
)

sha256sums_x86_64=(
    'SKIP'
    'SKIP'
)
sha256sums_aarch64=(
    'SKIP'
    'SKIP'
)

prepare() {
    local _arch=$(_get_arch "${CARCH}")
    cd "${srcdir}"
    if [ -f "dms-${_dms_cli_ver}-${_arch}.gz" ]; then
        gunzip -f "dms-${_dms_cli_ver}-${_arch}.gz"
    fi
}

package() {
    local _arch=$(_get_arch "${CARCH}")
    install -Dm755 "${srcdir}/dms-${_dms_cli_ver}-${_arch}" "$pkgdir/usr/bin/dms"
    cd "${srcdir}/DankMaterialShell-${pkgver}"
    install -dm755 "$pkgdir/etc/xdg/quickshell/dms"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/dms/README.md"
    if [ -d "./docs" ]; then
        install -dm755 "$pkgdir/usr/share/doc/dms/"
        cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"
    fi
    rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
