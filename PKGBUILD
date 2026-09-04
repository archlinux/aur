# Maintainer: mc_klatz

pkgname=sone
pkgver=0.21.0
pkgrel=2
pkgdesc="Native Linux TIDAL client — lossless streaming with bit-perfect ALSA output"
arch=('x86_64')
url="https://github.com/lullabyX/sone"
license=('GPL-3.0-only')
conflicts=('sone-bin')

depends=(
    'alsa-lib'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-good'
    'gstreamer'
    'gtk3'
    'hicolor-icon-theme'
    'openssl'
    'webkit2gtk-4.1'
)

makedepends=(
    'nodejs'
    'pnpm'
    'rust'
)

optdepends=(
    'org.freedesktop.secrets: store the encryption key in the system keyring instead of a file'
    'gst-libav: FFmpeg AAC decoder for lossy quality tiers (faad from gst-plugins-bad is used otherwise)'
    'gst-plugin-pipewire: PipeWire audio support'
    'alsa-plugins: exclusive ALSA output (bit-perfect mode)'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89cc0f141461c7852be8eb24687a6a9e765656902f3de83db93a575d6959b4a9')

prepare() {
    cd "$pkgname-$pkgver"

    # Upstream pins pnpm via package.json#packageManager; ignore the check
    export pnpm_config_pm_on_fail=ignore
    pnpm install --frozen-lockfile

    sed -i 's/^Exec=.*/Exec=sone %u/' data/io.github.lullabyX.sone.desktop
}

build() {
    cd "$pkgname-$pkgver"

    export pnpm_config_pm_on_fail=ignore
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"

    pnpm tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "src-tauri/target/release/sone" "$pkgdir/usr/bin/sone"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "data/io.github.lullabyX.sone.desktop" \
        "$pkgdir/usr/share/applications/io.github.lullabyX.sone.desktop"
    install -Dm644 "data/io.github.lullabyX.sone.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.lullabyX.sone.metainfo.xml"

    for size in 32x32 64x64 128x128; do
        install -Dm644 "src-tauri/icons/$size.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/io.github.lullabyX.sone.png"
    done
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.lullabyX.sone.png"
}
