# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
# Contributor: Jonathan Bangert <jonathan@bangert.dk>
pkgname=music-assistant-desktop
pkgver=0.3.4
pkgrel=1
pkgdesc="Music Assistant Desktop Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-app"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'cargo-tauri'
    'curl'
    'file'
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
conflicts=('music-assistant-desktop-git' 'music-assistant-desktop-bin' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d4e16c92e5cdc908dcd4724dfe118b84d740d0ec463d8e2b8e1c9845704fcadb')
# ring + lto is failing: https://github.com/briansmith/ring/issues/2746
options=('!lto')

prepare() {
    cd "$srcdir/desktop-app-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path src-tauri/Cargo.toml
    yarn install --frozen-lockfile

    # Fix desktop file to match actual binary and icon names
    sed -i 's/Exec=music-assistant-desktop/Exec=music-assistant-companion/' music-assistant.desktop
    sed -i 's/Icon=music-assistant$/Icon=music-assistant-companion/' music-assistant.desktop
}

build() {
    cd "$srcdir/desktop-app-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"

    # Enable debug info so makepkg can split it into the -debug package
    export CARGO_PROFILE_RELEASE_DEBUG=2

    cargo tauri build --no-bundle
}

package() {
    cd "$srcdir/desktop-app-$pkgver"

    # Install binary
    install -Dm755 "$srcdir/target/release/music-assistant-companion" \
        "$pkgdir/usr/bin/music-assistant-companion"

    # Install desktop file
    install -Dm644 music-assistant.desktop \
        "$pkgdir/usr/share/applications/music-assistant.desktop"

    # Install icons
    install -Dm644 src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/64x64.png \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/icon-512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-companion.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
