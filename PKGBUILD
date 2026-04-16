# Maintainer: Mark Unger <chacocode@gmail.com>
pkgname=kokoro-reader-git
_pkgname=kokoro-reader
pkgver=0.1.0.r0.g0000000
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
  'sonic'
  'pcaudiolib'
)
makedepends=('rust' 'cargo' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_pkgname::git+$url.git"
  "pdfium-linux-x64.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F7776/pdfium-linux-x64.tgz"
)
sha256sums=(
  'SKIP'
  '8aa6036e2643aeb699f6390f3a9fff3f28d4add64ffc727d0cbc85670bb1417c'
)
options=('!lto')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver
  ver=$(grep -m1 '^version' desktop/Cargo.toml | cut -d'"' -f2)
  printf "%s.r%s.g%s" \
    "$ver" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname/desktop"
  mkdir -p lib/lib
  cp "$srcdir/lib/libpdfium.so" lib/lib/libpdfium.so
}

build() {
  cd "$srcdir/$_pkgname/desktop"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname/desktop"

  install -Dm755 "$srcdir/target/release/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm755 "$srcdir/lib/libpdfium.so" \
    "$pkgdir/usr/lib/libpdfium.so"

  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "$srcdir/$_pkgname/README.md" \
    "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
