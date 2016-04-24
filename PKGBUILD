# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=libringclient-git
pkgver=20160420
pkgrel=1
pkgdesc="Client communication library for Ring (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=("ring-daemon-git" "qt5-base")
makedepends=('git' 'cmake')
conflicts=('libringclient')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-lrc")
md5sums=('SKIP')

pkgver() {
  cd "ring-lrc"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
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
