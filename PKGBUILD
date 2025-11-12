
# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=dms-shell-bin
pkgver=0.4.3
pkgrel=3
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
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz"
)
source_aarch64=(
    dms.service
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz"
)

sha256sums_x86_64=('513be09c9a4f56fe1274b6bc823d2eafaa3f3da9892bd668767844b83c94011a'
                   '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                   '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                   '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
                   'a2378ee2ee189b4a2cb7aaecd237c12dcba390e42801531bf9420dfc637e0eda')
sha256sums_aarch64=('513be09c9a4f56fe1274b6bc823d2eafaa3f3da9892bd668767844b83c94011a'
                    '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                    '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                    '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
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

    # Install shell completions
    install -Dm644 "completions.bash" "$pkgdir/usr/share/bash-completion/completions/dms"
    install -Dm644 "completions.fish" "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
    install -Dm644 "completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_dms"
}
