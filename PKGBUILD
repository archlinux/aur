# Maintainer: patcito
pkgname=prettymux
pkgver=0.2.10
pkgrel=1
pkgdesc="GPU-accelerated terminal multiplexer"
arch=('x86_64')
url="https://github.com/patcito/prettymux"
license=('GPL-3.0-only')
options=('!debug')
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
  zig build \
    -Dapp-runtime=none \
    -Doptimize=ReleaseFast \
    -Dtarget=x86_64-linux-gnu

  # Build prettymux
  cd "$srcdir/prettymux/src/gtk"
  meson setup builddir --buildtype=release --prefix=/usr -Dghostty_dir="$srcdir/ghostty"
  ninja -C builddir
}

package() {
  # Install meson targets so installed RPATH matches the package layout.
  cd "$srcdir/prettymux/src/gtk"
  DESTDIR="$pkgdir" meson install -C builddir --no-rebuild

  # Shared library
  install -Dm644 "$srcdir/ghostty/zig-out/lib/libghostty.so" \
    "$pkgdir/usr/lib/prettymux/libghostty.so"

  # Data files
  install -Dm644 "$srcdir/prettymux/src/gtk/prettymux-shell-integration.sh" \
    "$pkgdir/usr/share/prettymux/shell-integration.sh"
  install -Dm644 "$srcdir/prettymux/src/gtk/prettymux-bashrc.sh" \
    "$pkgdir/usr/share/prettymux/prettymux-bashrc.sh"
  install -Dm755 "$srcdir/prettymux/src/gtk/bin/open" \
    "$pkgdir/usr/share/prettymux/bin/open"
  install -Dm755 "$srcdir/prettymux/src/gtk/bin/xdg-open" \
    "$pkgdir/usr/share/prettymux/bin/xdg-open"

  # Desktop entry
  install -Dm644 "$srcdir/prettymux/packaging/prettymux.desktop" \
    "$pkgdir/usr/share/applications/prettymux.desktop"
  install -Dm644 "$srcdir/prettymux/packaging/prettymux.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/prettymux.svg"

  # License
  install -Dm644 "$srcdir/prettymux/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
