# Maintainer: Amir Goodarzi <amir007ag@gmail.com>
pkgname=safepaste
pkgver=0.2.2
pkgrel=3
pkgdesc='Offline-first desktop app for automatic secret redaction before sharing'
arch=('x86_64' 'aarch64')
url='https://github.com/a-goodarzi/SafePaste'
license=('MIT')
depends=(
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'librsvg'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'npm'
    'patchelf'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a-goodarzi/SafePaste/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28548c3907ed4368afe65b82c073ab4a1dd3f256241caad0ffec3534b3a029e8')

prepare() {
    cd "SafePaste-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    # Give the GTK/Wayland window a stable app ID so desktop shells can match
    # it to com.safepaste.desktop and display the packaged application icon.
    grep -q '"enableGTKAppId": true' src-tauri/tauri.conf.json ||
        sed -i '/"app": {/a\    "enableGTKAppId": true,' src-tauri/tauri.conf.json
    # The release archive's lockfile retains the previous application version.
    # Fix only the local workspace entry; cargo update --offline would require
    # a crates.io index that is not present in a clean build environment.
    sed -i "/^name = \"safepaste\"$/,/^$/s/^version = \".*\"$/version = \"$pkgver\"/" \
        src-tauri/Cargo.lock
    # Pre-fetch all Rust crate dependencies (respects Cargo.lock)
    cargo fetch --manifest-path src-tauri/Cargo.toml --locked
    # Install JS build dependencies
    npm ci
}

build() {
    cd "SafePaste-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    # Build binary only — packaging (deb/AppImage) handled by install()
    npm run tauri build -- --no-bundle
}

package() {
    cd "SafePaste-$pkgver"

    # Binary
    install -Dm755 src-tauri/target/release/safepaste \
        "$pkgdir/usr/bin/safepaste"

    # Icons
    install -Dm644 src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/safepaste.png"
    install -Dm644 src-tauri/icons/64x64.png \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/safepaste.png"
    install -Dm644 src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/safepaste.png"
    install -Dm644 src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/safepaste.png"
    install -Dm644 src-tauri/icons/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/safepaste.png"
    install -Dm644 src-tauri/icons/safepaste-appicon-terracotta.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/safepaste.svg"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/com.safepaste.desktop" <<END
[Desktop Entry]
Name=SafePaste
Comment=Paste text. Redact secrets. Share safely.
Exec=safepaste
Icon=safepaste
Terminal=false
Type=Application
Categories=Utility;Security;
Keywords=redact;secrets;privacy;clipboard;paste;
StartupWMClass=com.safepaste
END

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
