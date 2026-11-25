# Maintainer: FishfulThinking
#
# The AUR copy of ../arch/PKGBUILD: the same build, but from the tagged
# release tarball instead of the local checkout. Push this file, .SRCINFO and
# poe-waytrade.install to ssh://aur@aur.archlinux.org/poe-waytrade.git (master).
# Keep it in step with ../arch/PKGBUILD when the build changes.
pkgname=poe-waytrade
pkgver=2.2.0
pkgrel=1
pkgdesc="In-game Vulkan price-check overlay for Path of Exile and Path of Exile 2 on Wayland"
arch=('x86_64')
url="https://github.com/Maselkov/poe-waytrade"
# The OCR models (item displays) are CC BY-SA 4.0: see ocrs-models-NOTICE.md.
license=('GPL-3.0-or-later' 'CC-BY-SA-4.0')
depends=('vulkan-icd-loader' 'wayland' 'freetype2' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'wayland-protocols' 'shaderc' 'cargo')
optdepends=('chromium: trade search for rare items (or google-chrome)'
            'xdg-utils: open trade searches in your browser')
# Rust links with lld, which can't read the GCC LTO objects of C deps (ring).
options=('!lto')
install=poe-waytrade.install
# ocrs's models, as the daemon would otherwise download them on first use
# (daemon/src/ocr.rs). Pinned by hash: a new upload fails the build rather
# than shipping untested models.
_models=https://ocrs-models.s3-accelerate.amazonaws.com
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$_models/text-detection.onnx"
        "$_models/text-recognition.onnx")
sha256sums=('7a45021baaa7b41f7cdba6a5752c35750ee885a9822f8aceb643451f321401da'
            'a917b23dbd9524b465df7e922641b3ff2981623df4ded5a0234004ef2fee7cfe'
            '86c145c2edb96c8caed5b1ebb8f44d706408922211451c309c625157dd6061c5')

# The build reports its version from `git describe`, and $srcdir sits inside
# the AUR's own git repo, so pin it instead of letting it find that one.
export WAYTRADE_VERSION="$pkgver"

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --manifest-path daemon/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --manifest-path daemon/Cargo.toml
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  # The OCR tests read the fixtures with the shipped models.
  export POE_WAYTRADE_OCR_MODELS="$srcdir"
  cargo test --frozen --release --manifest-path daemon/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 "$srcdir/target/release/poe-waytrade-daemon" "$pkgdir/usr/bin/poe-waytrade-daemon"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    packaging/poe-waytrade-daemon.service \
    packaging/poe-waytrade-daemon.socket
  install -Dm644 -t "$pkgdir/usr/share/poe-waytrade/ocrs" \
    "$srcdir/text-detection.onnx" "$srcdir/text-recognition.onnx"
  install -Dm644 packaging/ocrs-models-NOTICE.md \
    "$pkgdir/usr/share/licenses/$pkgname/ocrs-models-NOTICE.md"
}
