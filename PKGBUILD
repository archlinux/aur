# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack-git
pkgver=r2387
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack"
license=('GPL3')
depends=('opencv-git' 'qt5-serialport')
makedepends=('git' 'cmake')
provides=('opentrack')
conflicts=('opentrack')
source=("git+https://github.com/opentrack/opentrack.git" "opentrack.desktop")
sha256sums=('SKIP'
            '4d98f03a759d14d1cf6436741135b5b11de9b1975b5dd67407010a13f86fa8e4')

pkgver() {
  cd "$srcdir/opentrack"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd opentrack
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DSDK_ENABLE_LIBEVDEV=ON -DCMAKE_INSTALL_PREFIX=/opt/opentrack ..
  make
}

package() {
  cd opentrack/build
  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

