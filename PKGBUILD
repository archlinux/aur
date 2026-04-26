# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=wflow-bin
_pkgname=wflow
pkgver=0.3.7
pkgrel=1
pkgdesc="A workflow engine for Wayland automation — Shortcuts-style GUI + CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cushycush/wflow"
license=('MIT' 'Apache-2.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
    'qt6-base'
    'qt6-declarative'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'libnotify: desktop notifications via notify-send'
    'wl-clipboard: clipboard via wl-copy'
    'xdg-desktop-portal: input via libei portal + Record Mode'
)

# The release tarball ships the binary, completions, and man pages.
# The desktop entry and scalable icon live in the source tree under
# packaging/flatpak/, so we pull those two files individually from
# the matching git tag — cheaper than fetching the whole source
# archive for two text files.
source=(
    "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
    "io.github.cushycush.wflow.desktop::https://raw.githubusercontent.com/cushycush/wflow/v$pkgver/packaging/flatpak/io.github.cushycush.wflow.desktop"
    "io.github.cushycush.wflow.svg::https://raw.githubusercontent.com/cushycush/wflow/v$pkgver/packaging/flatpak/io.github.cushycush.wflow.svg"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    local stage="$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

    install -Dm755 "$stage/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # Shell completions (already named the way each shell expects).
    install -Dm644 "$stage/completions/wflow.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$stage/completions/_wflow" \
        "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 "$stage/completions/wflow.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

    # Man pages — one wflow.1 plus one wflow-<sub>.1 per subcommand.
    install -d "$pkgdir/usr/share/man/man1"
    install -m644 "$stage/man/"*.1 "$pkgdir/usr/share/man/man1/"

    # Desktop entry + icon (pulled separately above).
    install -Dm644 "$srcdir/io.github.cushycush.wflow.desktop" \
        "$pkgdir/usr/share/applications/io.github.cushycush.wflow.desktop"
    install -Dm644 "$srcdir/io.github.cushycush.wflow.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.cushycush.wflow.svg"

    # Docs + licenses.
    install -Dm644 "$stage/README.md"      "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$stage/KDL.md"         "$pkgdir/usr/share/doc/$_pkgname/KDL.md"
    install -Dm644 "$stage/LICENSE-MIT"    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
    install -Dm644 "$stage/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
