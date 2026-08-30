# Maintainer: Aspenini <aspeninifeltner@gmail.com>

pkgname=gmod-record-press
pkgver=0.2.0
pkgrel=1
pkgdesc="Desktop app for creating Working Record Player album addons for Garry's Mod"
arch=('x86_64')
url="https://github.com/Aspenini/gmod-record-press"
license=('MIT')

depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
    'xdg-utils'
)

makedepends=(
    'bun'
    'cargo'
    'openssl'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
)

optdepends=(
    'steam: Steam Workshop publishing support'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"

    bun install --frozen-lockfile
    cargo fetch \
        --locked \
        --manifest-path src-tauri/Cargo.toml
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"

    # Build only the Debian bundle. Tauri's generated Debian data tree
    # gives us the executable, .desktop file, icons, etc. in FHS layout.
    NO_STRIP=1 bun run tauri build -b deb
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    local data_dir
    data_dir="$(
        find src-tauri/target/release/bundle/deb \
            -type d -name data -print -quit
    )"

    if [[ -z "$data_dir" ]]; then
        error "Could not find Tauri Debian bundle data directory"
        return 1
    fi

    # Install Tauri's generated FHS tree.
    cp -a "$data_dir/." "$pkgdir/"

    # steamworks-rs dynamically links Valve's Steamworks redistributable.
    # The project sets an RPATH for this location on Linux.
    install -Dm755 \
        src-tauri/target/release/libsteam_api.so \
        "$pkgdir/usr/lib/$pkgname/libsteam_api.so"
}
