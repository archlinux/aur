# Maintainer: Asitha Kanchana <asithakanchana1@users.noreply.github.com>

pkgname=wasi-whatsapp
pkgver=0.1.2
pkgrel=1
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
sha256sums=('922a6c1ec2a4b77f5293bdc4b83a0f464eab81830ac931b126abc62c91a52fbc')

prepare() {
    # CARGO_HOME must be set inside functions — $srcdir is not defined at
    # global PKGBUILD scope, causing /.cargo (root-owned, unwritable).
    export CARGO_HOME="$srcdir/.cargo"

    cd "W-ASI-$pkgver/src-tauri"
    # Pre-fetch Cargo dependencies while network is available.
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    export CARGO_HOME="$srcdir/.cargo"

    cd "W-ASI-$pkgver/src-tauri"
    # --no-bundle: build only the binary, skip AppImage/deb/rpm generation.
    # Those bundles are irrelevant for an AUR package and waste ~10 minutes.
    # NO_STRIP=1 prevents linuxdeploy's bundled strip from choking on modern
    # Arch ELF .relr.dyn sections (still needed for the tauri build step).
    NO_STRIP=1 cargo tauri build --no-bundle
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
