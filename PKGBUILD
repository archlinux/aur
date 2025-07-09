# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glog-git
pkgver=0.7.1.r43.g53d58e4
pkgrel=1
pkgdesc="C++ implementation of the Google logging module"
arch=('i686' 'x86_64')
url="https://github.com/google/glog"
license=('BSD-3-Clause')
depends=('gcc-libs' 'gflags')
makedepends=('git' 'cmake')
provides=("google-glog=$pkgver")
conflicts=('google-glog')
source=('git+https://github.com/google/glog.git')
sha256sums=('SKIP')


pkgver() {
  cd "glog"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "glog"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DWITH_PKGCONFIG=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "glog"

  #cmake --build "_build" --target test
}

package() {
  cd "glog"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/glog"
}

