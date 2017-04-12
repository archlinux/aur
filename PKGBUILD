# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=libringclient
pkgver=1.0.0.r165.g2afa81dc
pkgrel=1
epoch=1
pkgdesc="Client communication library for ring.cx (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="https://ring.cx"
license=('GPL3')
groups=("ring")
depends=("ring-daemon" "qt5-base")
makedepends=('git' 'cmake' 'qt5-tools')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-lrc#commit=2afa81dce53c64db4966da146bf255f55cd1ac4d")
md5sums=('SKIP')

pkgver() {
  cd "ring-lrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ring-lrc"

  msg2 'Building...'
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "ring-lrc/build"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
