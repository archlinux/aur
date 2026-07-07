# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
pkgname=music-assistant-desktop-git
pkgver=0.5.0.r2.gf82d26c
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
    'git'
    'libayatana-appindicator'
    'librsvg'
    'nodejs'
    'rust'
    'wget'
    'yarn'
)
conflicts=('music-assistant-desktop' 'music-assistant-desktop-bin' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path src-tauri/Cargo.toml
    yarn install --frozen-lockfile

    # Fix desktop file to match actual icon name
    sed -i 's/Icon=music-assistant$/Icon=music-assistant-companion/' music-assistant.desktop
}

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
   
    # Disable flto in CFLAGS to prevent the ring build.rs steps from producing
    # GNU specific IR that rust-lld does not know how to link. If we don't do
    # this then we'll get unresolved symbols for ring core symbols.
    # 
    # We could instead using a clang toolchain to build, but if the host clang
    # toolchain happens to be too far ahead of the rust-lld LLVM version, we
    # might run into bytecode/attribute definition errors.
    # 
    # Fundamentally we don't want to be linking against partially LTO'd objects
    # given the build.rs 'cc' crate usage, instead build them regularly and let
    # the final link stage do the extra work, for portability.
    # 
    # Rust's final link performs LTO via the LTO configuration further down.
    export CFLAGS="${CFLAGS//-flto*/}"
    export CXXFLAGS="${CXXFLAGS//-flto*/}"

    # Enable debug info so makepkg can split it into the -debug package
    export CARGO_PROFILE_RELEASE_DEBUG=2
    
    # Enable the release optimizations that are commented out in the source "for
    # build speed".
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    export CARGO_PROFILE_RELEASE_LTO=true
    export CARGO_PROFILE_RELEASE_OPT_LEVEL=s
    export CARGO_PROFILE_RELEASE_PANIC=abort

    cargo tauri build --no-bundle
}

package() {
    cd "$srcdir/$pkgname"

    # Install binary
    install -Dm755 "$srcdir/target/release/music-assistant-companion" \
        "$pkgdir/usr/bin/music-assistant-companion"

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
    install -Dm644 src-tauri/icons/app-icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/music-assistant-companion.svg"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
