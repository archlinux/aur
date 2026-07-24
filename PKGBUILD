# Maintainer: zer0bav <baverozmen@proton.me>
pkgname=rustcast-git
_pkgname=rustcast
pkgver=r16.be7205a
pkgrel=1
pkgdesc="A Raycast-class launcher for Linux (GTK4 + layer-shell) with clipboard history, file search and a tldr search"
arch=('x86_64')
url="https://github.com/zer0bav/rustcast"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
# Disable makepkg's global LTO: it injects -flto into the C build of the bundled
# SQLite (rusqlite), producing GCC bitcode that rust's linker can't resolve
# (undefined sqlite3_bind_*). The Cargo release profile still does Rust-side LTO.
options=('!lto')
optdepends=(
  'wl-clipboard: clipboard history and {clipboard} snippets on Wayland'
  'xclip: clipboard support on X11'
  'curl: download tldr pages'
  'libarchive: extract tldr pages (bsdtar)'
  'tesseract: OCR text out of clipboard images'
  'libqalculate: richer calculator (a built-in evaluator works without it)'
  'iproute2: port inspector (ss)'
)
provides=('rustcast')
conflicts=('rustcast')
source=("git+https://github.com/zer0bav/rustcast.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu" || cargo fetch
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen 2>/dev/null || cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/rustcast" "$pkgdir/usr/bin/rustcast"
  install -Dm644 "packaging/rustcast.desktop" "$pkgdir/usr/share/applications/rustcast.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
  # systemd user units (resident launcher + clipboard daemon). The units use
  # %h/.local/bin/rustcast; symlink so the system-installed binary is found.
  install -Dm644 "packaging/rustcast.service" "$pkgdir/usr/lib/systemd/user/rustcast.service"
  install -Dm644 "packaging/rustcast-clipboard.service" "$pkgdir/usr/lib/systemd/user/rustcast-clipboard.service"
  sed -i "s#%h/.local/bin/rustcast#/usr/bin/rustcast#g" \
    "$pkgdir/usr/lib/systemd/user/rustcast.service" \
    "$pkgdir/usr/lib/systemd/user/rustcast-clipboard.service"
}
