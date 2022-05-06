# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libusb-git
pkgver=1.0.26.r3.gba698478
pkgrel=1
pkgdesc="A cross-platform library to access USB devices"
arch=('i686' 'x86_64')
url="https://libusb.info/"
license=('LGPL')
depends=('glibc' 'libudev.so')
makedepends=('git')
provides=("libusb=$pkgver" 'libusb-1.0.so')
conflicts=('libusb')
options=('staticlibs')
source=("git+https://github.com/libusb/libusb.git")
sha256sums=('SKIP')


pkgver() {
  cd "libusb"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libusb"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libusb"

  make check
}

package() {
  cd "libusb"

  make DESTDIR="$pkgdir" install
}
