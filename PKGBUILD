# Maintainer: Mark Unger <chacocode@gmail.com>
# Use this PKGBUILD once a git tag (e.g. v0.1.0) exists.
# Rename to PKGBUILD and regenerate .SRCINFO before publishing.
pkgname=kokoro-reader
pkgver=0.2.1
pkgrel=1
pkgdesc="Minimal PDF reader with built-in neural text-to-speech (Kokoro 82M)"
arch=('x86_64')
url="https://github.com/Samhamsam/kokoro-reader"
license=('MIT')
depends=(
  'alsa-lib'
  'fontconfig'
  'gtk3'
  'libxkbcommon'
  'espeak-ng'
  'libsonic'
  'pcaudiolib'
)
makedepends=('rust' 'cargo' 'pkgconf')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "pdfium-linux-x64.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F7776/pdfium-linux-x64.tgz"
)
sha256sums=(
  '85f3e25ffd2726ab7b834179ab3bac1c99a0d9a4afe41e59b33239db4f40c533'
  '8aa6036e2643aeb699f6390f3a9fff3f28d4add64ffc727d0cbc85670bb1417c'
)
options=('!lto')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/desktop"
  mkdir -p lib/lib
  cp "$srcdir/lib/libpdfium.so" lib/lib/libpdfium.so
}

build() {
  cd "$srcdir/$pkgname-$pkgver/desktop"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver/desktop"

  install -Dm755 "$srcdir/target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "$srcdir/lib/libpdfium.so" \
    "$pkgdir/usr/lib/libpdfium.so"

  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
