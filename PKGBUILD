# Maintainer: rg-Sens Contributors
pkgname=rg-sens-git
pkgver=0.5.3.r0.g0bcd268
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
    'webkit2gtk-4.1: CSS Template panel with WebView support'
)
install=rg-sens.install
provides=('rg-sens')
conflicts=('rg-sens')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.5.3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    export CARGO_HOME="$srcdir/cargo"
    export RUSTUP_TOOLCHAIN=stable

    cargo build --release --locked
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

    # Install license
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" 2>/dev/null || true
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" 2>/dev/null || true
}
