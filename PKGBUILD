# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rpi-imager-git
pkgver=1.7.4.r23.g23b0bf6
pkgrel=1
pkgdesc="Raspberry Pi imaging utility"
arch=('i686' 'x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('Apache')
depends=('glibc' 'curl' 'hicolor-icon-theme' 'libarchive' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'zlib')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('dosfstools: SD card bootloader support')
provides=("rpi-imager=$pkgver")
conflicts=('rpi-imager')
source=("git+https://github.com/raspberrypi/rpi-imager.git")
sha256sums=('SKIP')


pkgver() {
  cd "rpi-imager"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "rpi-imager"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    src
  make -C "_build"
}

package() {
  cd "rpi-imager"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "license.txt" -t "$pkgdir/usr/share/licenses/rpi-imager"
}
