pkgname=wallrift-git
pkgver=e9081c7
pkgrel=1

pkgdesc="Wayland wallpaper engine with smooth cursor-based parallax effect"
arch=('x86_64')
url="https://github.com/saber-88/wallrift"
license=('MIT')

depends=('wayland' 'wayland-cursor' 'libxkbcommon' 'libglvnd')
makedepends=('git' 'cmake' 'make' 'gcc')

provides=('wallrift')
conflicts=('wallrift')

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --tags --long --always 2>/dev/null | sed 's/^v//;s/-/./g' || \
    echo "r$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"

  # binaries
  install -Dm755 build/wallrift "$pkgdir/usr/bin/wallrift"
  install -Dm755 build/wallrift-daemon "$pkgdir/usr/bin/wallrift-daemon"

  # shaders
  install -d "$pkgdir/usr/share/wallrift/shaders"
  cp -r shaders/. "$pkgdir/usr/share/wallrift/shaders/"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
