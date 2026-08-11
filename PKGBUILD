# Maintainer: Noam Lewis
#
# Binary package - downloads prebuilt binary from GitHub releases

pkgname=fresh-editor-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=('x86_64' 'aarch64')

source_x86_64=("fresh-editor-${pkgver}-x86_64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
             "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")
source_aarch64=("fresh-editor-${pkgver}-aarch64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
               "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")

sha256sums_x86_64=("5f4730a614e30fbbbf3e232cd28013929d90c3dfbe7ef59b1ce53a2aadb647af"
                  "SKIP")
sha256sums_aarch64=("fadd8ee9535278f702b66af3dbdedf1e0bae63e3f05d0a581fe185c7ea3dc628"
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

    # Provenance receipt: tells the editor it was installed from the AUR
    # binary package so updates defer to the user's AUR helper.
    install -dm755 "$pkgdir/usr/share/fresh-editor"
    cat > "$pkgdir/usr/share/fresh-editor/install-receipt.toml" <<EOF
schema = 1
channel = "aur-bin"
version = "$pkgver"
package_name = "fresh-editor"
managed = true
self_update = false

[hints]
aur_pkg = "fresh-editor-bin"
EOF

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/fresh-editor/README.md"

    # License
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Plugins and themes are compiled into the binary (embed-plugins feature),
    # so the release tarball ships no on-disk plugins/ directory.

    # Desktop file
    install -Dm644 fresh.desktop "$pkgdir/usr/share/applications/fresh.desktop"

    # Hicolor icons
    for icon in icons/*/apps/fresh.png; do
        size=$(basename $(dirname $(dirname "$icon")))
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}/apps/fresh.png"
    done
}
