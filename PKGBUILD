# Maintainer: mc_klatz
pkgname=sone
pkgver=0.8.0
pkgrel=1
pkgdesc="Native Linux TIDAL client — lossless streaming with bit-perfect ALSA output"
arch=('x86_64')
url="https://github.com/lullabyX/sone"
license=('GPL-3.0-only')
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
    'npm'
)
optdepends=(
    'gst-plugin-pipewire: PipeWire audio support'
    'alsa-plugins: exclusive ALSA output (bit-perfect mode)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lullabyX/sone/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12bf5f818d62ca74dc2c16ef9ef3b71cbe99ba14b14230ec21a27e025052ad88')

prepare() {
       cd "$srcdir/sone-$pkgver"
       npm ci
       sed -i 's/"active": true/"active": false/' src-tauri/tauri.conf.json
}


build() {
    cd "$srcdir/sone-$pkgver"
    if ! rustc --version | awk '{split($2,v,"."); if (v[1]<1 || (v[1]==1 && v[2]<85)) exit 1}'; then
        error "Rust >= 1.85 required (edition2024 support)"
        return 1
    fi
    export CARGO_HOME="$srcdir/cargo-home"
    npm run tauri build
}

package() {
    cd "$srcdir/sone-$pkgver"
    install -Dm755 "src-tauri/target/release/sone" "$pkgdir/usr/bin/sone"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "data/io.github.lullabyX.sone.desktop" \
        "$pkgdir/usr/share/applications/sone.desktop"
    for size in 32x32 64x64 128x128; do
        install -Dm644 "src-tauri/icons/${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/sone.png"
    done
}
