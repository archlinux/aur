# Maintainer: blitzkriegfc <blitzkriegfc@proton.me>
pkgname=qbz
pkgver=1.1.18
pkgrel=1
pkgdesc="Native Qobuz client for Linux with bit-perfect hi-res audio, DAC passthrough, Last.fm scrobbling, and Chromecast/DLNA casting"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libappindicator-gtk3' 'libxkbcommon' 'openssl' 'sqlite' 'dbus')
makedepends=('nodejs' 'npm' 'rust' 'cargo' 'pkgconf' 'cmake' 'gcc' 'perl')
optdepends=(
    'alsa-utils: Required for bit-perfect device detection and better ALSA device names'
    'pipewire-alsa: PipeWire audio support'
    'pipewire-pulse: PulseAudio compatibility'
)
provides=('qbz')
conflicts=('qbz-bin' 'qbz-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vicrodh/qbz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/qbz-${pkgver}"

    # Use system SQLite instead of bundled (proper distro packaging)
    sed -i 's/rusqlite = { version = "0.31", features = \["bundled"\]/rusqlite = { version = "0.31"/g' \
        src-tauri/Cargo.toml \
        crates/qbz-audio/Cargo.toml \
        crates/qbz-library/Cargo.toml \
        crates/qbz-integrations/Cargo.toml
}

build() {
    cd "${srcdir}/qbz-${pkgver}"

    # Workaround: Arch's rust package defaults to rust-lld which breaks
    # ring crate's native C/ASM library linking. Force traditional ld.
    export RUSTFLAGS="-C link-arg=-fuse-ld=bfd"

    npm ci
    npm run build
    npx tauri build --no-bundle
}

package() {
    cd "${srcdir}/qbz-${pkgver}"

    # Install binary
    install -Dm755 "src-tauri/target/release/qbz-nix" "${pkgdir}/usr/bin/qbz"

    # Install desktop file
    install -Dm644 "packaging/arch/qbz.desktop" "${pkgdir}/usr/share/applications/qbz.desktop"

    # Install icons (freedesktop hicolor structure)
    install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qbz.png"
    install -Dm644 "src-tauri/icons/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qbz.png"
    install -Dm644 "src-tauri/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qbz.png"
    install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qbz.png"
    install -Dm644 "src-tauri/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qbz.png"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
