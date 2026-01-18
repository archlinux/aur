# Maintainer: rg-Sens Contributors
pkgname=rg-sens-git
pkgver=0.6.4
pkgrel=1
pkgdesc="A fast, customizable system monitoring dashboard for Linux (git version)"
arch=('x86_64')
url="https://github.com/hilgardt-collab/rg-Sens"
license=('MIT' 'Apache-2.0')
depends=(
    'gtk4'
    'cairo'
    'pango'
    'glib2'
    'hicolor-icon-theme'
)
makedepends=(
    'rust'
    'cargo'
    'pkgconf'
    'git'
)
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring support'
    'webkitgtk-6.0: CSS Template panel with WebView support'
)
install=rg-sens.install
provides=('rg-sens')
conflicts=('rg-sens')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" || cd "$pkgname" || return 1
    # Try to get version from git tags first
    local ver
    ver=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    if [[ -n "$ver" ]]; then
        echo "$ver"
    else
        # Fallback: use Cargo.toml version + commit count + short hash
        local base count hash
        base=$(grep -m1 '^version' Cargo.toml | sed 's/.*"\(.*\)"/\1/')
        count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
        hash=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
        echo "${base}.r${count}.g${hash}"
    fi
}

build() {
    cd "$pkgname"

    export CARGO_HOME="$srcdir/cargo"
    export RUSTUP_TOOLCHAIN=stable

    cargo build --release
}

package() {
    cd "$pkgname"

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

    # Install CSS template examples
    install -d "$pkgdir/usr/share/rg-sens/examples"
    install -Dm644 "examples/art_nouveau_panel.html" \
        "$pkgdir/usr/share/rg-sens/examples/art_nouveau_panel.html"
    install -Dm644 "examples/art_nouveau_panel.css" \
        "$pkgdir/usr/share/rg-sens/examples/art_nouveau_panel.css"
    install -Dm644 "examples/art_nouveau_panel_responsive.html" \
        "$pkgdir/usr/share/rg-sens/examples/art_nouveau_panel_responsive.html"
    install -Dm644 "examples/art_nouveau_panel_responsive.css" \
        "$pkgdir/usr/share/rg-sens/examples/art_nouveau_panel_responsive.css"
    install -Dm644 "examples/steampunk_panel.html" \
        "$pkgdir/usr/share/rg-sens/examples/steampunk_panel.html"
    install -Dm644 "examples/steampunk_panel.css" \
        "$pkgdir/usr/share/rg-sens/examples/steampunk_panel.css"
    install -Dm644 "examples/css_template_example.html" \
        "$pkgdir/usr/share/rg-sens/examples/css_template_example.html"
    install -Dm644 "examples/css_template_example.css" \
        "$pkgdir/usr/share/rg-sens/examples/css_template_example.css"
    install -Dm644 "examples/rg-sens-gauges.js" \
        "$pkgdir/usr/share/rg-sens/examples/rg-sens-gauges.js"

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
