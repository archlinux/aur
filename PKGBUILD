# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libpcap-git
pkgver=1.10.4.r782.g6c6198ad
pkgrel=1
pkgdesc="A portable C/C++ library for network traffic capture"
arch=('i686' 'x86_64')
url="https://www.tcpdump.org/"
license=('BSD')
depends=('glibc' 'dbus' 'libnl')
makedepends=('git' 'bluez-libs')
provides=("libpcap=$pkgver" 'libpcap.so')
conflicts=('libpcap')
options=('staticlibs')
source=("git+https://github.com/the-tcpdump-group/libpcap.git")
sha256sums=('SKIP')


pkgver() {
  cd "libpcap"

  _tag=$(git tag -l --sort -creatordate | grep -E '^libpcap-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libpcap-//'
}

build() {
  cd "libpcap"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libpcap"

  make tests
}

package() {
  cd "libpcap"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libpcap"
}
