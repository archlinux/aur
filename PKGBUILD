# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=libringclient
pkgver=1.0.0.r78.g9f22305
pkgrel=1
epoch=1
pkgdesc="Client communication library for Ring (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=("ring-daemon" "qt5-base")
makedepends=('git' 'cmake')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-lrc#commit=9f223051f401185fdb6aaaaf5b842027555f9ea9")
md5sums=('SKIP')

pkgver() {
  cd "ring-lrc"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
