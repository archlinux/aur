# Maintainer: Denis Kopin <deng@lixun.app>
pkgname=lixun
pkgver=0.7.10
pkgrel=1
pkgdesc="Spotlight-like launcher for Linux (core: daemon, gui, cli, preview)"
arch=('x86_64')
url="https://lixun.app"
license=('MIT OR Apache-2.0')
options=(!debug !lto)
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'xdg-utils'
  'poppler-glib'
  'zstd'
  'sqlite'
  'gcc-libs'
  'xz'
  'libheif'
)
optdepends=(
  'lixun-semantic: dense-vector hybrid retrieval via the sidecar worker'
  'lixun-ocr: OCR for scanned PDFs and images via tesseract'
  'antiword: legacy .doc preview'
  'catdoc: legacy .xls/.ppt preview'
  'libreoffice-fresh: full office-suite preview'
  'gst-plugins-good: audio/video preview'
  'gst-plugins-bad: extra audio/video codecs'
  'gst-plugins-ugly: extra audio/video codecs'
  'gst-libav: ffmpeg-backed codec coverage'
  'xdg-terminal-exec: terminal-launching shell hits'
)
makedepends=('cargo' 'clang' 'cmake' 'protobuf')
conflicts=('lixun-bin' 'lupa' 'lupa-bin')
_commit=8e7e8d5a9fba14df49c24a40a3abcd04eb9c1371
source=("$pkgname-$pkgver.tar.gz::https://github.com/dengkeping/lixun/archive/$_commit.tar.gz")
sha256sums=('a85f4e04fcf1705c7d41f8eed5e4d29cdc71af363df8e4e565a6f600434fc9dc')

prepare() {
  cd "$srcdir/lixun-$_commit"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked
}

build() {
  cd "$srcdir/lixun-$_commit"
  export CARGO_TARGET_DIR="$srcdir/target"
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS
  cargo clean
  cargo build --release --frozen \
    -p lixun-daemon -p lixun-cli -p lixun-gui -p lixun-preview-bin
}

package() {
  cd "$srcdir/lixun-$_commit"
  install -Dm755 "$srcdir/target/release/lixund"        "$pkgdir/usr/bin/lixund"
  install -Dm755 "$srcdir/target/release/lixun-cli"     "$pkgdir/usr/bin/lixun-cli"
  install -Dm755 "$srcdir/target/release/lixun-gui"     "$pkgdir/usr/bin/lixun-gui"
  install -Dm755 "$srcdir/target/release/lixun-preview" "$pkgdir/usr/bin/lixun-preview"

  install -Dm644 packaging/systemd/lixund.service \
    "$pkgdir/usr/lib/systemd/user/lixund.service"
  install -Dm644 packaging/desktop/app.lixun.daemon.desktop \
    "$pkgdir/usr/share/applications/app.lixun.daemon.desktop"
  install -Dm644 packaging/icons/lixun-logo-light.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/app.lixun.daemon.svg"

  install -Dm644 crates/lixun-gui/assets/matugen/lixun-colors.css.tmpl \
    "$pkgdir/usr/share/lixun/matugen/lixun-colors.css.tmpl"

  install -Dm644 docs/config.example.toml \
    "$pkgdir/usr/share/doc/lixun/config.example.toml"

  install -Dm644 LICENSE-MIT     "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
