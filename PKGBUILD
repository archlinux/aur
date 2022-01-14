# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libproxy-git
pkgver=r879.g5d5e13d
pkgrel=1
pkgdesc="A library that provides automatic proxy configuration management"
arch=('i686' 'x86_64')
url="https://libproxy.github.io/libproxy/"
license=('LGPL')
depends=('glibc' 'glib2' 'dbus')
makedepends=('git' 'cmake' 'perl' 'python' 'webkit2gtk')
provides=('libproxy')
conflicts=('libproxy')
options=('staticlibs')
source=("git+https://github.com/libproxy/libproxy.git")
sha256sums=('SKIP')


pkgver() {
  cd "libproxy"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libproxy"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBIPR=OFF \
    -DPERL_VENDORINSTALL=ON \
    -DWITH_WEBKIT3=ON \
    ./
  make -C "_build"
}

check() {
  cd "libproxy"

  make -C "_build" test
}

package() {
  cd "libproxy"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libproxy"
}
