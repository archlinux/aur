# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=odhcpd-git
pkgver=r582.g4308384
pkgrel=1
pkgdesc="OpenWrt DHCP Server"
arch=('i686' 'x86_64')
url="https://openwrt.org/docs/techref/odhcpd"
license=('GPL-2.0-or-later')
depends=('glibc' 'libnl-tiny' 'libubox' 'uci')
makedepends=('git' 'cmake')
provides=("odhcpd=$pkgver")
conflicts=('odhcpd')
source=("git+https://git.openwrt.org/project/odhcpd.git")
sha256sums=('SKIP')


pkgver() {
  cd "odhcpd"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "odhcpd"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_POLICY_VERSION_MINIMUM="3.5" \
    ./
  cmake --build "_build"
}

package() {
  cd "odhcpd"

  DESTDIR="$pkgdir" cmake --install "_build"
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
