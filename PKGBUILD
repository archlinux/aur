# Maintainer: mc_klatz
pkgname=sone
pkgver=0.19.0
pkgrel=1
pkgdesc="Native Linux TIDAL client — lossless streaming with bit-perfect ALSA output"
arch=('x86_64')
url="https://github.com/lullabyX/sone"
license=('GPL-3.0-only')
provides=('sone')
conflicts=('sone-bin')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'openssl'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
    'libsecret'
)
makedepends=(
    'rust'
    'nodejs'
    'pnpm'
)
optdepends=(
    'gst-plugin-pipewire: PipeWire audio support'
    'alsa-plugins: exclusive ALSA output (bit-perfect mode)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lullabyX/sone/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e10ac3b59a6bd58cc282693a6272a97c4ff6724a230ec2fa351d2abc6e4eca7e')

prepare() {
    cd "$srcdir/sone-$pkgver"
    pnpm install --frozen-lockfile --config.manage-package-manager-versions=false
    sed -i 's/"active": true/"active": false/' src-tauri/tauri.conf.json
    sed -i 's/^Exec=.*/Exec=sone/' data/io.github.lullabyX.sone.desktop
}

build() {
    cd "$srcdir/sone-$pkgver"
    if ! rustc --version | awk '{split($2,v,"."); if (v[1]<1 || (v[1]==1 && v[2]<85)) exit 1}'; then
        error "Rust >= 1.85 required (edition2024 support)"
        return 1
    fi
    export CARGO_HOME="$srcdir/cargo-home"
    pnpm tauri build
}

package() {
    cd "$srcdir/sone-$pkgver"
    install -Dm755 "src-tauri/target/release/sone" "$pkgdir/usr/bin/sone"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "data/io.github.lullabyX.sone.desktop" \
        "$pkgdir/usr/share/applications/sone.desktop"
    for size in 32x32 64x64 128x128; do
        install -Dm644 "src-tauri/icons/${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/io.github.lullabyX.sone.png"
    done
}
