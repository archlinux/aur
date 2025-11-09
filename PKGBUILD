
# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=dms-shell-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'quickshell'
    'dgop'
    'accountsservice'
)
optdepends=(
    'matugen-bin: Dynamic wallpaper-based theming'
    'dsearch-bin: Filesystem search'
    'i2c-tools: External monitor brightness control'
    'wl-clipboard: Copy functionality for PIDs and other elements'
    'cliphist: Clipboard history functionality'
    'cava: Audio visualizer'
    'qt6-multimedia: Sound effect support'
    'power-profiles-daemon: Set power profile'
    'qt6ct: Qt6 application theming'
)
provides=('dms')
conflicts=('dms-shell-git' 'dms-shell' 'dms-git')

_get_arch() {
    case "$1" in
        x86_64) echo "amd64" ;;
        aarch64) echo "arm64" ;;
        *) echo "unsupported" ;;
    esac
}

source_x86_64=(
    dms.service
    "dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz"
)
source_aarch64=(
    dms.service
    "dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz"
)

sha256sums_x86_64=('3641600632e6db51481ec2f6de5bc2fafd6e97f3792dc25acfc7d3703ceca4ff'
                   'a2378ee2ee189b4a2cb7aaecd237c12dcba390e42801531bf9420dfc637e0eda')
sha256sums_aarch64=('3641600632e6db51481ec2f6de5bc2fafd6e97f3792dc25acfc7d3703ceca4ff'
                    'c96e863e4b3fe0b6c88b0cebdd4ade9ecfdcd002d8cb13ca8156202097bdbccb')

package() {
    install -Dm755 "${srcdir}/bin/dms-distropkg" "$pkgdir/usr/bin/dms"

    install -dm755 "$pkgdir/usr/share/quickshell"
    cp -r "${srcdir}/dms" "$pkgdir/usr/share/quickshell/"

    # Install documentation from dms folders
    if [ -f "${srcdir}/dms/README.md" ]; then
        install -Dm644 "${srcdir}/dms/README.md" "$pkgdir/usr/share/doc/dms/README.md"
    fi
    if [ -d "${srcdir}/dms/docs" ]; then
        install -dm755 "$pkgdir/usr/share/doc/dms/"
        cp -r "${srcdir}/dms/docs"/* "$pkgdir/usr/share/doc/dms/"
    fi
    if [ -f "${srcdir}/dms/PLUGINS/README.md" ]; then
        install -Dm644 "${srcdir}/dms/PLUGINS/README.md" "$pkgdir/usr/share/doc/dms/plugins.md"
    fi
    install -Dm0644 "dms.service" "$pkgdir/usr/lib/systemd/user/dms.service"
}
