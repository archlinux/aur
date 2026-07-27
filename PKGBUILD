# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
# Contributor: Jonathan Bangert <jonathan@bangert.dk>
pkgname=music-assistant-desktop
pkgver=0.6.1
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
    'openssl'
    'libayatana-appindicator'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'cargo-tauri'
    'curl'
    'file'
    'librsvg'
    'rust'
    'wget'
)
conflicts=('music-assistant-desktop-git' 'music-assistant-desktop-bin' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b593dce0b8f3c30e7b7cd980af03aced6d6f838d4a830d94279b014810a5bd19')
# Never let makepkg put -flto in CFLAGS/CXXFLAGS/LDFLAGS here. The C sources
# pulled in through build.rs ('cc' crate) are compiled by gcc and emit GNU IR,
# which rust-lld cannot consume, so the final link fails on unresolved symbols.
# It surfaces as an opaque ring build failure, but the cause is the mixed
# GCC/LLVM IR, not ring: https://github.com/briansmith/ring/issues/2746
# Rust-side LTO is a separate setting and is unaffected by this.
options=('!lto')

prepare() {
    cd "$srcdir/desktop-app-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path src-tauri/Cargo.toml

    # Fix desktop file to match actual icon name
    sed -i 's/Icon=music-assistant$/Icon=music-assistant-companion/' music-assistant.desktop

    # The in-repo .desktop also omits StartupWMClass, so the running window does
    # not associate with the launcher entry. Tauri's own generated entry (see
    # the upstream .deb) sets it. Drop this once upstream ships it.
    grep -q '^StartupWMClass=' music-assistant.desktop ||
        echo 'StartupWMClass=music-assistant-companion' >> music-assistant.desktop
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

    # Install the tauri.conf.json "resources" (translations). Tauri resolves
    # resource_dir() to /usr/lib/<productName> on Linux, which is where the
    # upstream deb puts them too. Only en.json is compiled into the binary.
    install -Dm644 -t "$pkgdir/usr/lib/Music Assistant/resources/translations" \
        src-tauri/resources/translations/*.json

    # Install desktop file
    install -Dm644 music-assistant.desktop \
        "$pkgdir/usr/share/applications/music-assistant.desktop"

    # Install icons
    install -Dm644 src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/music-assistant-companion.png"
    install -Dm644 src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/music-assistant-companion.png"
    install -Dm644 app-icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-companion.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
