# Maintainer: Chris Sutcliff <chris@sutcliff.me>
pkgname=music-assistant-companion-git
pkgver=0.0.1.r17.g23883a6
pkgrel=1
pkgdesc="Music Assistant Companion - desktop app for Music Assistant (requires server 2.7.0+)"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-companion"
license=('Apache-2.0')
depends=(
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'cargo-tauri'
    'curl'
    'file'
    'git'
    'libappindicator-gtk3'
    'librsvg'
    'nodejs'
    'rust'
    'wget'
    'yarn'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
conflicts=('music-assistant-desktop' 'music-assistant-desktop-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path src-tauri/Cargo.toml
    yarn install --frozen-lockfile
}

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"

    # Build frontend
    yarn build:frontend

    # Build the Tauri application with deb bundle for easy extraction
    cargo tauri build --bundles deb
}

package() {
    cd "$srcdir/$pkgname"

    # Copy from deb bundle data directory
    cp -dR --preserve=mode,timestamps \
        "$srcdir/target/release/bundle/deb"/*/data/usr \
        -t "$pkgdir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
