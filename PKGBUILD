# Maintainer: Will Vauclain <willvauclain.dev at gmail dot com>
# Maintainer: Alex Zaslavsky <alex@wall-dev.org>
pkgname=gebaar-libinput-git
pkgver=r43.2d57aab
pkgrel=2
pkgdesc='A Super Simple WM Independent Touchpad Gesture Daemon for libinput. Forked version with new features'
arch=('x86_64')
url="https://github.com/Osleg/gebaar-libinput"
license=('GPL3')
depends=('libinput')
makedepends=('cmake' 'git')
conflicts=('gebaar')
provides=('gebaar')
source=('git+https://github.com/Osleg/gebaar-libinput')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/gebaar-libinput"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/gebaar-libinput
  git submodule init
  git submodule update
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
}

build() {
  cd $srcdir/gebaar-libinput/build
  make -j$(nproc)
}

package() {
  cd $srcdir/gebaar-libinput/build
  make DESTDIR="$pkgdir" install/strip
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
