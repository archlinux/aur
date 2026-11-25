# Maintainer: Da Chen <dachen@connect.hku.hk>
#
# The copy in the Wayper repository (packaging/aur/PKGBUILD) is the source of
# truth. The release workflow fills in pkgver and sha256sums and publishes it.
pkgname=wayper
pkgver=2.0.2
pkgrel=1
pkgdesc="Wayland-first wallpaper manager with Wallhaven integration"
arch=('x86_64' 'aarch64')
url="https://github.com/yuukidach/wayper"
license=('MIT')
_electron=electron41
depends=("$_electron" 'awww')
makedepends=('npm')
optdepends=(
    'hyprland: focused monitor detection'
    'sway: focused monitor detection'
)
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuukidach/wayper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9274475d839cd1e8a68cb32f681724d242b6fb9c437b3a9f0ff27eb1975a4d22')

build() {
    cd "$pkgname-$pkgver"
    export npm_config_cache="$srcdir/npm-cache"
    # The package runs on the system Electron and scores on the CPU.
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ONNXRUNTIME_NODE_INSTALL_CUDA=skip
    npm ci --no-audit --no-fund
    npm run build
    npm prune --omit=dev --no-audit --no-fund
}

package() {
    cd "$pkgname-$pkgver"
    local appdir="$pkgdir/usr/lib/$pkgname"

    install -dm755 "$appdir"
    cp -r dist node_modules "$appdir/"
    install -Dm644 package.json "$appdir/package.json"
    install -Dm644 -t "$appdir/assets" \
        assets/icon-256.png assets/trayTemplate.png assets/trayTemplate@2x.png

    # Keep only the ONNX Runtime build for this machine; the model is small
    # enough that the browser runtime and GPU providers are never used.
    local ortarch=x64
    [[ "$CARCH" == aarch64 ]] && ortarch=arm64
    local ortbin="$appdir/node_modules/onnxruntime-node/bin/napi-v3"
    find "$ortbin" -mindepth 2 -maxdepth 2 -type d ! -path "$ortbin/linux/$ortarch" \
        -exec rm -r {} +
    find "$ortbin" -mindepth 1 -maxdepth 1 -type d -empty -delete
    rm -f "$ortbin/linux/$ortarch"/libonnxruntime_providers_{cuda,tensorrt}.so
    rm -rf "$appdir/node_modules/onnxruntime-web"
    local hf="$appdir/node_modules/@huggingface/transformers"
    rm -rf "$hf/src" "$hf/types"
    rm -f "$hf"/dist/ort-wasm* "$hf"/dist/transformers.{js,min.js,web.js,web.min.js}
    find "$appdir/node_modules" -name '*.map' -delete
    # npm prune leaves the emptied scope directories of build-only packages.
    find "$appdir/node_modules" -type d -empty -delete

    install -Dm755 packaging/aur/wayper.sh "$pkgdir/usr/bin/wayper"
    sed -i "s|@ELECTRON@|$_electron|g" "$pkgdir/usr/bin/wayper"
    ln -s wayper "$pkgdir/usr/bin/wayper-gui"

    install -Dm644 assets/wayper.desktop "$pkgdir/usr/share/applications/wayper.desktop"
    local size
    for size in 32 64 128 256 512; do
        install -Dm644 "assets/icon-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/wayper.png"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
