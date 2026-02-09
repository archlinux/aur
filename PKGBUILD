# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
pkgname=music-assistant-desktop-git
pkgver=0.3.4.r0.g912133f
pkgrel=1
pkgdesc="Music Assistant Desktop Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-app"
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
conflicts=('music-assistant-desktop' 'music-assistant-desktop-bin' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
# ring + lto is failing: https://github.com/briansmith/ring/issues/2746
options=('!lto')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

    # We can use `export CARGO_PROFILE_RELEASE_TRIM_PATHS=true` once stable in cargo.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir=/build"

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
