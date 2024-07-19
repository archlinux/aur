# Maintainer: Bence Toth <oss at bnctth dot dev>
# Based on Chocobo1's rpi-image-git package, thanks!

pkgname=unraid-usb-creator-git
pkgver=1.0.0.r19.g166e950
pkgrel=1
pkgdesc="Unraid os usb creator utility"
arch=('i686' 'x86_64')
url="https://github.com/unraid/usb-creator-next"
license=('Apache')
depends=('glibc' 'curl' 'hicolor-icon-theme' 'libarchive' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'zlib')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("unraid-usb-creator=$pkgver")
conflicts=('unraid-usb-creator')
source=("git+https://github.com/unraid/usb-creator-next.git")
sha256sums=('SKIP')


pkgver() {
  cd "usb-creator-next"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "usb-creator-next"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    src
  make -C "_build"
}

package() {
  cd "usb-creator-next"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "license.txt" -t "$pkgdir/usr/share/licenses/unraid-usb-creator"
}
