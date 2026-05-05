pkgname=yamp-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Yet Another Music Player - a QML based music player."
arch=('x86_64')
url="https://github.com/Wu28ri/yamp"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'taglib')
makedepends=('git' 'cmake' 'ninja')
provides=('yamp')
conflicts=('yamp')
source=("git+https://github.com/Wu28ri/yamp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yamp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/yamp"
  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/yamp"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "yamp.desktop" "$pkgdir/usr/share/applications/yamp.desktop"

  for size in 16 22 24 32 48 64 96 128 192 256 512; do
    install -Dm644 "icons/yamp-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/yamp.png"
  done

  install -Dm644 "icons/yamp.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/yamp.svg"

  install -Dm644 "icons/yamp-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/yamp-symbolic.svg"
}
