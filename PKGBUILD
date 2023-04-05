# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=getdns-git
pkgver=1.7.3.r3.gf8c95b4f
pkgrel=1
pkgdesc="A modern asynchronous DNS API"
arch=('i686' 'x86_64')
url="https://getdnsapi.net/"
license=('BSD')
depends=('glibc' 'libev' 'libevent' 'libidn2' 'libuv' 'openssl' 'unbound')
makedepends=('git')
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

  libtoolize -ci
  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --with-libev \
    --with-libevent \
    --with-libuv \
    --with-trust-anchor=/etc/trusted-key.key
  make
}

check() {
  cd "getdns"

  #make test
}

package() {
  cd "getdns"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/getdns"
}
