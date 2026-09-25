# Maintainer: Douglas de Moura <douglasdemoura@users.noreply.github.com>
pkgname=disktree
pkgver=0.10.0
pkgrel=1
pkgdesc="A treemap for finding and removing what fills your disk, for Omarchy. Rust + GPUI"
arch=('x86_64' 'aarch64')
url="https://github.com/tobi/disktree"
license=('MIT')
depends=('gcc-libs' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb'
         'libglvnd')
makedepends=('rust' 'pkgconf')
# !lto: makepkg's -flto=auto turns the C shims (wayland log shim, freetype)
# into GCC LTO bytecode, which rustc's default linker (rust-lld) cannot read.
options=('!lto')
optdepends=('mesa: GL driver for rendering (or your GPU vendor driver)'
            'trash-cli: move marked files to the trash with trash-put'
            'glib2: move marked files to the trash with gio trash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobi/disktree/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('417322c206fee9383af938731919876e866c7910d8ff4fb9a43b6b8cbf5ad54e')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_TERM_COLOR=always
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TERM_COLOR=always
  cargo build --release --locked --frozen --offline -p disktree-app
}

# The scanner, layout and removal tests run headless; the window-harness
# tests need a GPU-backed Wayland/X11 session, which makepkg cannot provide.
check() {
  cd "$pkgname-$pkgver"
  export CARGO_TERM_COLOR=always
  cargo test --locked --frozen --offline -p disktree-core
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/disktree "$pkgdir/usr/bin/disktree"
  install -Dm644 assets/disktree.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/disktree.svg"
  sed -e 's|@BINDIR@|/usr/bin|g' -e "s|@VERSION@|$pkgver|g" \
    packaging/disktree.desktop.in > "$pkgname.desktop"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
