# Maintainer: coffee <catheadcoffee@gmail.com>
pkgname=tmd-type-markdown
pkgver=0.1.33
pkgrel=1
pkgdesc="A local Markdown editor with a similar experience to Typora"
arch=('x86_64')
url="https://github.com/KoniKee/TMD_Type-Markdown"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo-tauri'
  'nodejs'
  'npm'
  'rust'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

# GitHub archive extracts to TMD_Type-Markdown-vX.Y.Z/
_srcroot() {
  find "$srcdir" -maxdepth 1 -mindepth 1 -type d -name 'TMD_Type-Markdown*' | head -n1
}

prepare() {
  cd "$(_srcroot)"
  npm install --no-audit --no-fund
}

build() {
  cd "$(_srcroot)"

  # Use `cargo tauri build --no-bundle` instead of bare `cargo build --release`.
  # The Tauri CLI automatically injects the `custom-protocol` feature (which
  # the upstream Cargo.toml leaves disabled), ensuring the binary uses embedded
  # frontend via tauri://localhost rather than devUrl (http://localhost:1420).
  cargo tauri build --no-bundle
}

package() {
  cd "$(_srcroot)"

  # Binary
  install -Dm755 "src-tauri/target/release/md-editor" \
    "$pkgdir/usr/lib/$pkgname/md-editor"

  # Wrapper script with two workarounds:
  # 1. WEBKIT_DISABLE_DMABUF_RENDERER=1 — NVIDIA GBM doesn't support all
  #    buffer modifiers WebKitGTK DMA-BUF renderer requests. Disables DMA-BUF
  #    zero-copy path but keeps GL-accelerated compositing.
  # 2. WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS=1 — WebKitGTK sandbox
  #    blocks Tauri's custom tauri://localhost protocol handler, causing
  #    "Could not connect to localhost: Connection refused" fallback to TCP.
  #    WEBKIT_FORCE_SANDBOX is deprecated since WebKitGTK 2.44+.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/bin/bash
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS=1
exec /usr/lib/tmd-type-markdown/md-editor "$@"
WRAPPER

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=MD Editor
Comment=A local Markdown editor with a similar experience to Typora
Exec=tmd-type-markdown
Icon=tmd-type-markdown
Terminal=false
Categories=Office;TextEditor;
MimeType=text/markdown;
DESKTOP

  # Icons
  install -Dm644 "src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # License
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
