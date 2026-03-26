# Maintainer: patcito
pkgname=prettymux
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU-accelerated terminal multiplexer"
arch=('x86_64')
url="https://github.com/patcito/prettymux"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-webengine' 'libgl')
makedepends=('cmake' 'gcc' 'zig' 'git')
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
  cd "$srcdir/prettymux/src/qt"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DGHOSTTY_DIR="$srcdir/ghostty"
  make -j$(nproc)
}

package() {
  # Binary
  install -Dm755 "$srcdir/prettymux/src/qt/build/prettymux" \
    "$pkgdir/usr/bin/prettymux"

  # Shared library
  install -Dm644 "$srcdir/ghostty/zig-out/lib/libghostty.so" \
    "$pkgdir/usr/lib/prettymux/libghostty.so"

  # Data files
  install -Dm644 "$srcdir/prettymux/src/qt/welcome.html" \
    "$pkgdir/usr/share/prettymux/welcome.html"
  install -Dm644 "$srcdir/prettymux/src/qt/prettymux-shell-integration.sh" \
    "$pkgdir/usr/share/prettymux/shell-integration.sh"

  # Desktop entry
  install -Dm644 "$srcdir/prettymux/packaging/prettymux.desktop" \
    "$pkgdir/usr/share/applications/prettymux.desktop"

  # License
  install -Dm644 "$srcdir/prettymux/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
