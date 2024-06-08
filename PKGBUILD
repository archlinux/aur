# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail.com>
# Contributor: boypt <pentie at gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=zeromq-git
pkgver=4.3.5.r35.gc2fae814
pkgrel=1
pkgdesc="Fast messaging system built on sockets. C and C++ bindings. aka 0MQ, ZMQ"
arch=('i686' 'x86_64')
url="https://zeromq.org/"
license=('MPL-2.0')
depends=('gcc-libs' 'gnutls' 'libpgm' 'libsodium' 'util-linux')
makedepends=('git' 'asciidoc' 'cmake' 'pkgconf' 'xmlto')
optdepends=('cppzmq: C++ binding for libzmq')
provides=("zeromq=$pkgver" 'libzmq.so')
conflicts=('zeromq')
options=('staticlibs')
source=("git+https://github.com/zeromq/libzmq.git")
sha256sums=('SKIP')


pkgver() {
  cd "libzmq"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libzmq"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DENABLE_CURVE=ON \
    -DWITH_LIBSODIUM=ON \
    -DWITH_OPENPGM=ON \
    -DOPENPGM_PKGCONFIG_NAME="openpgm-5.3" \
    ./
  cmake --build "_build"
}

check() {
  cd "libzmq"

  #cmake --build "_build" --target test
}

package() {
  cd "libzmq"

  DESTDIR="$pkgdir" cmake --install "_build"
}
