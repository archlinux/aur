# Maintainer: gardar <aur@gardar.net>

pkgname=immich-desktop
pkgver=0.2.3
pkgrel=1
pkgdesc="Unofficial native Qt desktop client for Immich"
arch=('x86_64')
url="https://github.com/hdmain/immich-desktop"
license=('MIT')
depends=('hicolor-icon-theme' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "packaging-options.patch")
sha256sums=('a44196bab2492aafa9fa1c6718b006ac8e0e327b94ab086a23514ca00b148946'
            'b8a44b31ee7bb7653356565459b1c9dc6d122c494f497dc9181a921f3ac951d8')

prepare() {
  cd "$pkgname-$pkgver"
  # Build options to turn off the self-updater, rename the executable and label the build.
  patch -Np1 -i "$srcdir/packaging-options.patch"
}

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DIMMICH_ENABLE_UPDATER=OFF \
    -DIMMICH_EXECUTABLE_NAME=immich-desktop \
    -DIMMICH_BUILD_INFO=AUR
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
