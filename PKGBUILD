# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier-bin
_pkgname=vernier
pkgver=0.4.0
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
    'fontconfig'
    'freetype2'
    'libglvnd'
    'libxkbcommon'
    'pipewire'
    'wayland'
)
optdepends=(
    'grim: capture held-rect regions via wlr-screencopy'
    'slurp: region selection for the external screenshot shortcut'
    'wl-clipboard: copy screenshots / measurements to the clipboard'
    'libnotify: post-capture notifications'
    'xdg-desktop-portal-hyprland: global hotkey via the GlobalShortcuts portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('50939a5cbba69c30c6f30fa6e50fad5c9367d6fad7869c38e3bb7baf08fea355')
sha256sums_aarch64=('ccc59c0950b55ba5afb55df46a47017b15f7720d6f4a70a3977f6318e572ecfa')

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
