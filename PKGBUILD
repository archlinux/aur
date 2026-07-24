# Maintainer: Noam Lewis
#
# Binary package - downloads prebuilt binary from GitHub releases

pkgname=fresh-editor-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=('x86_64' 'aarch64')

source_x86_64=("fresh-editor-${pkgver}-x86_64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
             "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")
source_aarch64=("fresh-editor-${pkgver}-aarch64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
               "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")

sha256sums_x86_64=("71ca18f5a29040a2de5e3a23a854fa14be0eb8f70eb3d25bac1cc95703332b29"
                  "SKIP")
sha256sums_aarch64=("46c8a5e3a844a39407c1f657cc2b705bcc6853eb69ec5dd7dee8338d40b2bb24"
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
