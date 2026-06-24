# Maintainer: rg-Sens Contributors
pkgname=rg-sens-git
pkgver=0.8.2
pkgrel=2
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
    'webkit2gtk-4.1: CSS Template panel with WebView support'
)
install=rg-sens.install
# Disable makepkg's global LTO: -flto=auto leaks into the `ring` crate's C/asm
# build (via the cc crate reading CFLAGS), producing GCC-LTO objects that
# rust-lld cannot resolve, causing undefined ring_core_* symbols at link time.
# The Rust release profile still performs its own (LLVM) LTO.
options=(!lto)
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
        # Fallback: use base version + commit count + short hash
        local count hash
        count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
        hash=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
        echo "0.8.2.r${count}.g${hash}"
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
    install -Dm644 "data/com.github.rg-sens.desktop" \
        "$pkgdir/usr/share/applications/com.github.rg-sens.desktop"

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
