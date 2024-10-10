# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=getdns-git
pkgver=1.7.3.r3.gf8c95b4f
pkgrel=2
pkgdesc="A modern asynchronous DNS API"
arch=('i686' 'x86_64')
url="https://getdnsapi.net/"
license=('BSD-3-Clause')
depends=('glibc' 'libev' 'libevent' 'libidn2' 'libuv' 'openssl' 'unbound')
makedepends=('git' 'cmake')
checkdepends=('check')
provides=("getdns=$pkgver")
conflicts=('getdns')
options=('staticlibs')
source=("git+https://github.com/getdnsapi/getdns.git")
sha256sums=('SKIP')


prepare() {
  cd "getdns"

  git submodule update --init --recursive
}

pkgver() {
  cd "getdns"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "getdns"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_TESTING=OFF \
    -DCURRENT_DATE=$(date -u --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%dT%H:%M:%SZ") \
    -DPATH_TRUST_ANCHOR_FILE=/etc/trusted-key.key \
    ./
  cmake --build "_build"
}

check() {
  cd "getdns"

  #cmake --build "_build" --target test
}

package() {
  cd "getdns"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/getdns"
}
