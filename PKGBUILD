# Maintainer: Roy <roymedina@me.com>
pkgname=observer-ai
pkgver=1.3.3
pkgrel=1
pkgdesc="Observer - AI-powered application built with Tauri"
arch=('x86_64')
url="https://github.com/Roy3838/Observer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'libappindicator-gtk3' 'librsvg' 'cargo' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Roy3838/Observer/archive/v$pkgver.tar.gz")
sha256sums=('aec14de4066004f643a88e8b1b214ba0af5c197c799300d33e0905e84eabfda2')

prepare() {
    cd "$srcdir/Observer-$pkgver/app"
    # Disable updater artifacts for AUR build to avoid signing errors
    sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
    npm install
}

build() {
    cd "$srcdir/Observer-$pkgver/app"
    # Set environment variables to fix ring crate compilation
    export CC=gcc
    export CXX=g++
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
    # Fix ring crate compilation issues
    export CFLAGS="-fPIC -O2"
    export CXXFLAGS="-fPIC -O2"
    export LDFLAGS="-Wl,-z,now -Wl,-z,relro"
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS="-C target-cpu=native"
    # Disable signing for packaging
    unset TAURI_SIGNING_PRIVATE_KEY
    unset TAURI_SIGNING_PRIVATE_KEY_PASSWORD
    # Force only deb bundle to avoid linking issues
    npm run tauri:build -- --bundles deb
}

package() {
    cd "$srcdir/Observer-$pkgver"
    # Install the binary directly from the release build
    install -Dm755 "app/src-tauri/target/release/app" "$pkgdir/usr/bin/observer-ai"
    
    # Install the static files that Tauri expects
    install -dm755 "$pkgdir/usr/lib/Observer/_up_"
    cp -r "app/dist" "$pkgdir/usr/lib/Observer/_up_/"
}
