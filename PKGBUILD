# Maintainer: isra <israelzermeno82@gmail.com>
pkgname=dmgr-desktop
pkgver=2.1.0
pkgrel=4
pkgdesc="Modern device manager for Linux — Tauri + React (devices, drivers, audio, Bluetooth, kernel modules)"
arch=('x86_64')
url="https://github.com/Khinmmad/dmgr"
license=('MIT')
depends=('polkit' 'webkit2gtk-4.1' 'gtk3' 'libxkbcommon' 'wayland' 'libgl')
optdepends=(
    'pipewire-pulse: audio device switching (pactl)'
    'pulseaudio: audio device switching (pactl)'
    'wireplumber: audio device switching (wpctl)'
    'alsa-utils: audio device listing fallback'
    'bluez-utils: Bluetooth device management'
)
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkg-config')
provides=('dmgr-desktop')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/dmgr-$pkgver"

    # The v2.1.0 tag was published BEFORE the `custom-protocol` feature was
    # added to desktop/src-tauri/Cargo.toml, so the release tarball doesn't
    # declare it. Without the feature, Tauri builds in dev mode and the binary
    # tries to load http://localhost:1420 at runtime ("localhost failed").
    # We inject a [features] block so the build flag below resolves.
    sed -i '/^path = "src\/main\.rs"$/a\
\
[features]\
custom-protocol = ["tauri/custom-protocol"]' \
        desktop/src-tauri/Cargo.toml
}

build() {
    # Frontend + Tauri backend (nested workspace under desktop/).
    cd "$srcdir/dmgr-$pkgver/desktop"
    npm install
    npm run build
    # `custom-protocol` is REQUIRED for production: without it the binary builds
    # in Tauri dev mode and tries to load http://localhost:1420 at runtime
    # ("localhost failed"). The Tauri CLI sets this automatically; plain
    # `cargo build` does not, so we pass it explicitly.
    cargo build --release --features custom-protocol --manifest-path src-tauri/Cargo.toml

    # Privileged helper from the root workspace.
    cd "$srcdir/dmgr-$pkgver"
    cargo build --release -p dmgr-polkit-helper
}

package() {
    cd "$srcdir/dmgr-$pkgver"

    # Main desktop binary (frontend embedded)
    install -Dm755 desktop/src-tauri/target/release/dmgr-desktop \
        "$pkgdir/usr/bin/dmgr-desktop"

    # Privileged helper (invoked via pkexec)
    install -Dm755 target/release/dmgr-polkit-helper \
        "$pkgdir/usr/bin/dmgr-polkit-helper"

    # Polkit policy
    install -Dm644 resources/org.dmgr.DeviceManager.policy \
        "$pkgdir/usr/share/polkit-1/actions/org.dmgr.DeviceManager.policy"

    # Desktop entry + icon
    install -Dm644 resources/dmgr-desktop.desktop \
        "$pkgdir/usr/share/applications/dmgr-desktop.desktop"
    install -Dm644 desktop/src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/dmgr-desktop.png"
    install -Dm644 desktop/src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/dmgr-desktop.png"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
