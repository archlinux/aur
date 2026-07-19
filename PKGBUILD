# Maintainer: Asitha Kanchana <asithakanchana1@users.noreply.github.com>
#
# RELEASE PKGBUILD — builds from a published GitHub release tarball.
# Requires a v*.*.* tag to be pushed to GitHub first.
#
# For local development testing (no tag needed), use PKGBUILD-git instead:
#   makepkg -si -p PKGBUILD-git
#
# Before submitting to AUR:
#   1. Push the release tag: git tag v0.1.0 && git push origin v0.1.0
#   2. Compute sha256: curl -sL <tarball_url> | sha256sum
#   3. Replace sha256sums=('SKIP') with the real hash
#   4. Regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO

pkgname=wasi-whatsapp
pkgver=0.1.0
pkgrel=2
pkgdesc="Lightweight native WhatsApp Web wrapper for Arch Linux (Rust + Tauri + WebKitGTK)"
arch=('x86_64')
url="https://github.com/AsithaKanchana1/W-ASI"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'appmenu-gtk-module'
    'librsvg'
)
makedepends=(
    'rust'
    'cargo'
    'base-devel'
    'curl'
    'wget'
    'file'
    'openssl'
)
provides=('wasi-whatsapp')
conflicts=('wasi-whatsapp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update with: curl -sL <url> | sha256sum

prepare() {
    # CARGO_HOME must be set inside functions — $srcdir is not defined at
    # global PKGBUILD scope, so a top-level export resolves to /.cargo.
    export CARGO_HOME="$srcdir/.cargo"

    cd "W-ASI-$pkgver/src-tauri"
    # Pre-fetch Cargo dependencies (network is available during prepare).
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    export CARGO_HOME="$srcdir/.cargo"

    cd "W-ASI-$pkgver/src-tauri"
    # NO_STRIP=1 prevents linuxdeploy from using its bundled strip binary
    # which cannot handle modern Arch Linux ELF .relr.dyn sections.
    NO_STRIP=1 cargo tauri build
}

check() {
    export CARGO_HOME="$srcdir/.cargo"

    cd "W-ASI-$pkgver/src-tauri"
    # Unit tests are headless — no display server required.
    cargo test
}

package() {
    cd "W-ASI-$pkgver"

    # Binary
    install -Dm755 "src-tauri/target/release/wasi" \
        "$pkgdir/usr/bin/wasi"

    # XDG desktop entry
    install -Dm644 "aur/wasi.desktop" \
        "$pkgdir/usr/share/applications/wasi.desktop"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/wasi.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/wasi.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/wasi.png"

    # Licence
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
