pkgname=wallrift-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland wallpaper engine with smooth cursor-based parallax effect"
arch=('x86_64')
url="https://github.com/saber-88/wallrift"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libglvnd')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('wallrift')
conflicts=('wallrift')

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --always || echo "r$(git rev-list --count HEAD)"
}

build() {
  cd "$pkgname"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "$pkgname"

  # Install binaries
  install -Dm755 build/wallrift "$pkgdir/usr/bin/wallrift"
  install -Dm755 build/wallrift-daemon "$pkgdir/usr/bin/wallrift-daemon"

  # Install shaders
  install -d "$pkgdir/usr/share/wallrift/shaders"
  cp -r shaders/* "$pkgdir/usr/share/wallrift/shaders/"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
