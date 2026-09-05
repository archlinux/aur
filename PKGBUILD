# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier-bin
_pkgname=vernier
pkgver=0.5.2
pkgrel=1
pkgdesc="Cross-platform pixel-measurement overlay in Rust (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/vernier"
license=('MIT' 'Apache-2.0')
# !debug suppresses the split `vernier-bin-debug` companion package
# so AUR helpers don't prompt for it on install. The Rust release
# binary still keeps its panic location info for backtraces.
options=(!debug)
depends=(
    'grim'
    'fontconfig'
    'freetype2'
    'libglvnd'
    'libxkbcommon'
    'pipewire'
    'wayland'
)
optdepends=(
    'slurp: region selection for the external screenshot shortcut'
    'wl-clipboard: copy screenshots / measurements to the clipboard'
    'libnotify: post-capture notifications'
    'xdg-desktop-portal-hyprland: global hotkey via the GlobalShortcuts portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('1343fd02ee6813b8fc8abf3c03d881e40048e28b28925d082dad24bce10ea686')
sha256sums_aarch64=('aa71b3da9cb979f127cf0b968b3c22c7792c26a0598ef06ffcf463bbfcf67e06')

package() {
    # The tarball's top-level dir is named after the host arch, so
    # makepkg can pick the right one whether we're packaging on
    # x86_64 or aarch64. $CARCH is set by makepkg for us.
    cd "$srcdir/$_pkgname-$pkgver-$CARCH"

    install -Dm755 vernier "$pkgdir/usr/bin/vernier"

    install -Dm644 vernier.desktop \
        "$pkgdir/usr/share/applications/vernier.desktop"

    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r icons/. "$pkgdir/usr/share/icons/hicolor/"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
