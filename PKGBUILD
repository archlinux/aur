# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rpi-imager-git
pkgver=1.9.6.r34.gf60a01d3
pkgrel=1
pkgdesc="Raspberry Pi imaging utility"
arch=('i686' 'x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('Apache-2.0')
depends=('gcc-libs' 'curl' 'gnutls' 'hicolor-icon-theme' 'libarchive' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'xz')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=(
  'dosfstools: SD card bootloader support'
  'udisks2: Needed if you want to be able to run rpi-imager as a regular user'
)
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
    -DENABLE_CHECK_VERSION=OFF \
    src
  cmake --build "_build"
}

package() {
  cd "rpi-imager"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "doc/man/rpi-imager.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "debian/changelog" -t "$pkgdir/usr/share/doc/rpi-imager"
  install -Dm644 "license.txt" -t "$pkgdir/usr/share/licenses/rpi-imager"
}
