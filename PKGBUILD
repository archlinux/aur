# Maintainer: patcito
pkgname=prettymux
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU-accelerated terminal multiplexer"
arch=('x86_64')
url="https://github.com/patcito/prettymux"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'json-glib')
makedepends=('meson' 'ninja' 'gcc' 'zig' 'git')
source=(
  "prettymux::git+https://github.com/patcito/prettymux.git"
  "ghostty::git+https://github.com/patcito/ghostty.git#branch=linux-embedded-platform"
)
sha256sums=('SKIP' 'SKIP')

build() {
  # Build ghostty
  cd "$srcdir/ghostty"
  zig build -Dapp-runtime=none -Doptimize=ReleaseFast

  # Build prettymux
  cd "$srcdir/prettymux/src/gtk"
  meson setup builddir --buildtype=release -Dghostty_dir="$srcdir/ghostty"
  ninja -C builddir
}

package() {
  # Binary
  install -Dm755 "$srcdir/prettymux/src/gtk/builddir/prettymux" \
    "$pkgdir/usr/bin/prettymux"

  # Shared library
  install -Dm644 "$srcdir/ghostty/zig-out/lib/libghostty.so" \
    "$pkgdir/usr/lib/prettymux/libghostty.so"

  # Data files
  install -Dm644 "$srcdir/prettymux/src/gtk/welcome.html" \
    "$pkgdir/usr/share/prettymux/welcome.html"
  install -Dm644 "$srcdir/prettymux/src/gtk/prettymux-shell-integration.sh" \
    "$pkgdir/usr/share/prettymux/shell-integration.sh"

  # Desktop entry
  install -Dm644 "$srcdir/prettymux/packaging/prettymux.desktop" \
    "$pkgdir/usr/share/applications/prettymux.desktop"

  # License
  install -Dm644 "$srcdir/prettymux/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
