# Maintainer: Noam Lewis
#
# Binary package - downloads prebuilt binary from GitHub releases

pkgname=fresh-editor-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=('x86_64' 'aarch64')

source_x86_64=("fresh-editor-${pkgver}-x86_64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
             "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")
source_aarch64=("fresh-editor-${pkgver}-aarch64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
               "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")

sha256sums_x86_64=("f0c97e5b5160f195a5d879c3581f2cca0a28ea1127d16dd04589277c114e9173"
                  "SKIP")
sha256sums_aarch64=("606988c01b1e6cc3c8c1aa6966e5f1874b1e6fd68d3f6bf1333bdfc414628dd3"
                   "SKIP")

depends=("gcc-libs" "glibc")
provides=("fresh-editor")
conflicts=("fresh-editor")
options=('!debug')

package() {
    cd "fresh-editor-$CARCH-unknown-linux-gnu"

    # Binary (installed alongside plugins, symlinked from /usr/bin)
    install -Dm755 fresh "$pkgdir/usr/share/fresh-editor/fresh"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/fresh-editor/fresh" "$pkgdir/usr/bin/fresh"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/fresh-editor/README.md"

    # License
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Plugins
    cp -r plugins "$pkgdir/usr/share/fresh-editor/"

    # Desktop file
    install -Dm644 fresh.desktop "$pkgdir/usr/share/applications/fresh.desktop"

    # Hicolor icons
    for icon in icons/*/apps/fresh.png; do
        size=$(basename $(dirname $(dirname "$icon")))
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}/apps/fresh.png"
    done
}
