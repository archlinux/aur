# PKGBUILD for RSJFW
pkgname=rsjfw-git
pkgver=r3.24abf8e
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer in C++"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine')
makedepends=('cmake' 'gcc' 'make' 'pkg-config')
conflicts=('rsjfw')
provides=('rsjfw')
source=('rsjfw::git+https://github.com/9nunya/RSJFW.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rsjfw"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/rsjfw" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  # Explicitly install desktop file and icon just in case CMake misses it or path differs
  install -Dm644 "$srcdir/rsjfw/rsjfw.desktop" "$pkgdir/usr/share/applications/rsjfw.desktop"
  install -Dm644 "$srcdir/rsjfw/assets/logo.png" "$pkgdir/usr/share/pixmaps/rsjfw.png"
  install -Dm644 "$srcdir/rsjfw/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
