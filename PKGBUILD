# Maintainer: rg-Sens Contributors
pkgname=rg-sens
pkgver=0.9.5
pkgrel=1
pkgdesc="A fast, customizable system monitoring dashboard for Linux"
arch=('x86_64')
url="https://github.com/hilgardt-collab/rg-Sens"
license=('MIT' 'Apache-2.0' 'OFL-1.1')
depends=(
    'gtk4'
    'cairo'
    'pango'
    'glib2'
    'hicolor-icon-theme'
    'webkitgtk-6.0'
)
makedepends=(
    'rust'
    'cargo'
    'pkgconf'
)
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring support'
)
install=rg-sens.install
provides=('rg-sens')
conflicts=('rg-sens-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bffde9443b60f2b9f582c6018460bb0bfd0557f46911557be7343d5227563d7a')

build() {
    cd "rg-Sens-$pkgver"

    # Build with all features
    # NVIDIA support requires nvidia-utils at runtime
    export CARGO_HOME="$srcdir/cargo"
    export RUSTUP_TOOLCHAIN=stable

    cargo build --release --locked
}

package() {
    cd "rg-Sens-$pkgver"

    # Install binary
    install -Dm755 "target/release/rg-sens" "$pkgdir/usr/bin/rg-sens"

    # Install desktop file
    install -Dm644 "data/rg-sens.desktop" \
        "$pkgdir/usr/share/applications/rg-sens.desktop"

    # Install icon
    install -Dm644 "rg-sens.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/rg-sens.png"

    # Install metainfo
    install -Dm644 "data/rg-sens.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/rg-sens.metainfo.xml"

    # Install examples
    install -d "$pkgdir/usr/share/rg-sens/examples"
    for f in examples/*.{html,css,js,json}; do
        [ -f "$f" ] && install -Dm644 "$f" "$pkgdir/usr/share/rg-sens/$f"
    done
    # Fonts the Art Deco / Art Nouveau templates load from next to themselves
    # (SIL Open Font License; each family carries its OFL.txt)
    cp -r examples/fonts "$pkgdir/usr/share/rg-sens/examples/"

    # Install documentation
    install -d "$pkgdir/usr/share/doc/rg-sens"
    install -Dm644 "docs/css-template-panel-guide.md" \
        "$pkgdir/usr/share/doc/rg-sens/css-template-panel-guide.md"
    install -Dm644 "README.md" \
        "$pkgdir/usr/share/doc/rg-sens/README.md"

    # Install license
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" 2>/dev/null || true
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" 2>/dev/null || true
}
